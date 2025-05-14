import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@HiveType(typeId: 11)
@freezed
abstract class AddressModel with _$AddressModel {
  factory AddressModel({
    @HiveField(0) required final String id,
    @HiveField(1) required final String label,
    @HiveField(2) required final String street,
    @HiveField(3) final String? city,
    @HiveField(4) final String? province,
    @HiveField(5) final String? postalCode,
  }) = _AddressModel;
}
