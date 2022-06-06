import 'package:cursus_app/model/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list_response.freezed.dart';

part 'category_list_response.g.dart';

@freezed
class CategoryListResponse with _$CategoryListResponse {
  factory CategoryListResponse({
    required List<CategoryModel> categoryList,
    required int count,
  }) = _CategoryListResponse;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
}
