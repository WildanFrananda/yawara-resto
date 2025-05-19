import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

part 'paginated_menu.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginatedMenu {
  final List<MenuModel> data;
  final int total;
  final int page;
  final int limit;

  PaginatedMenu({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory PaginatedMenu.fromJson(final Map<String, dynamic> json) =>
      _$PaginatedMenuFromJson(json);
}
