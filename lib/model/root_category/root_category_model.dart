import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_category_model.freezed.dart';

part 'root_category_model.g.dart';

@freezed
class RootCategoryModel with _$RootCategoryModel {
  factory RootCategoryModel({
    required int id,
    required String name,
    String? description,
    int? categoryId,
    String? icon,
    String? createdAt,
    String? color,
  }) = _RootCategoryModel;

  factory RootCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RootCategoryModelFromJson(json);
}
