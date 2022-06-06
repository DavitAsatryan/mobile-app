// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryListResponse _$$_CategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryListResponse(
      categoryList: (json['categoryList'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CategoryListResponseToJson(
        _$_CategoryListResponse instance) =>
    <String, dynamic>{
      'categoryList': instance.categoryList,
      'count': instance.count,
    };
