import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:push/push.dart';

@injectable
class PushNotification {
  final Push _push = Push.instance;

  Future<void> init() async {
    _push
      ..addOnMessage(
        // Handle foreground messages
        (final message) async {
          // Handle the message
          if (kDebugMode) {
            print('Foreground message: $message');
          }
        },
      )
      ..addOnBackgroundMessage(
        // Handle background messages
        (final message) async {
          // Handle the message
          if (kDebugMode) {
            print('Background message: $message');
          }
        },
      );
  }

  Future<void> requestPermission() async {
    await _push.requestPermission();
  }
}
