import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:mobile/data/model/address/address_model.dart';

class AddressViewModel extends ChangeNotifier {
  final Box<AddressModel> _box = Hive.box('addresses');
  List<AddressModel> addresses = [];

  AddressViewModel() {
    addresses = _box.values.toList();
  }

  Future<void> add(final AddressModel addr) async {
    await _box.put(addr.id, addr);
    addresses = _box.values.toList();
    notifyListeners();
  }

  Future<void> update(final AddressModel addr) async {
    await _box.put(addr.id, addr);
    addresses = _box.values.toList();
    notifyListeners();
  }

  Future<void> delete(final String id) async {
    await _box.delete(id);
    addresses = _box.values.toList();
    notifyListeners();
  }
}
