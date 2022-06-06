import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';

part 'sub_category_model.g.dart';

@freezed
class SubCategoryModel with _$SubCategoryModel {
  factory SubCategoryModel({
    required int id,
    required String name,
    required String icon,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
