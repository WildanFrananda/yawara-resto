import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile/data/model/booking/booking_request.dart';
import 'package:mobile/data/model/booking/booking_response.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/remote/booking_api_client.dart';
import 'package:mobile/presentation/viewmodels/offline/offline_view_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeViewModel extends ChangeNotifier {
  final OfflineViewModel offlineViewModel;
  final BookingApiClient _bookingApiClient;
  final Connectivity _connectivity;
  final Box<dynamic> _menuBox = Hive.box('menus');

  HomeViewModel(this._bookingApiClient, this._connectivity, this.offlineViewModel) {
    _listenConnectivity();
    _connectWebSocket();
    fetchMenus();
  }

  List<MenuModel> menus = [];
  bool loadingMenus = false;
  String? menuError;

  bool bookingLoading = false;
  String? bookingError;
  BookingResponse? lastBooking;

  bool online = true;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  WebSocketChannel? _walletChannel;
  StreamSubscription<dynamic>? wsSub;
  String paymentStatus = '';

  Future<void> fetchMenus() async {
    loadingMenus = true;
    menuError = null;
    notifyListeners();

    final cached = _menuBox.values.cast<MenuModel>().toList();
    if (cached.isNotEmpty) {
      menus = cached;
      loadingMenus = false;
      notifyListeners();
    }

    try {
      final apiMenus = await _bookingApiClient.fetchMenus();
      menus = apiMenus;

      await _menuBox.clear();

      for (var m in apiMenus) {
        await _menuBox.put(m.id, m);
      }
    } catch (e) {
      menuError = 'Failed to load menu!';
    } finally {
      loadingMenus = false;
      notifyListeners();
    }
  }

  Future<void> createBooking({
    required final List<MenuItemRequest> items,
    required final String location,
    required final DateTime schedule,
  }) async {
    if (schedule.hour < 9 || schedule.hour >= 21) {
      bookingError = 'Booking is only available from 9 AM to 9 PM';
      notifyListeners();
      return;
    }

    bookingLoading = true;
    bookingError = null;
    notifyListeners();

    try {
      final response = await _bookingApiClient.createBooking(
        BookingRequest(
          type: 'home dine in',
          menuItems: items,
          location: location,
          schedule: schedule,
        ),
      );
      lastBooking = response;
      paymentStatus = 'pending';
    } catch (e) {
      bookingError = 'Failed to create booking!';
      await offlineViewModel.saveDraft(
        items: items,
        location: location,
        schedule: schedule,
      );
      notifyListeners();
    } finally {
      bookingLoading = false;
      notifyListeners();
    }
  }

  void _listenConnectivity() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((final result) {
              online = result != ConnectivityResult.none;
              notifyListeners();
            })
            as StreamSubscription<ConnectivityResult>;
  }

  void _connectWebSocket() {
    final wsUrl = dotenv.env['WS_URL'];

    if (wsUrl != null) {
      _walletChannel = WebSocketChannel.connect(Uri.parse(wsUrl));
    } else {
      throw Exception('WebSocket URL is not defined in the environment variables.');
    }

    wsSub = _walletChannel!.stream.listen(
      (final message) {
        final data = message.toString();

        if (lastBooking != null && data.contains(lastBooking!.id)) {
          paymentStatus =
              data.contains('success')
                  ? 'success'
                  : data.contains('failed')
                  ? 'failed'
                  : 'pending';
          notifyListeners();
        }
      },
      onError: (_) {
        paymentStatus = 'failed';
        notifyListeners();
      },
      onDone: () {
        paymentStatus = 'failed';
        notifyListeners();
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _connectivitySubscription.cancel();
    await _walletChannel?.sink.close();
    await wsSub?.cancel();
    super.dispose();
  }
}
