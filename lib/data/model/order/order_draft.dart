import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';

part 'order_draft.freezed.dart';
part 'order_draft.g.dart';

@HiveType(typeId: 20)
@freezed
abstract class OrderDraft with _$OrderDraft {
  factory OrderDraft({
    @HiveField(0) required final String id,
    @HiveField(1) required final List<MenuItemRequest> items,
    @HiveField(2) required final String location,
    @HiveField(3) required final DateTime schedule,
    @HiveField(4) required final DateTime savedAt,
    @HiveField(5) @Default(0) final int retryCount,
  }) = _OrderDraft;

  factory OrderDraft.fromJson(final Map<String, dynamic> json) =>
      _$OrderDraftFromJson(json);
}
