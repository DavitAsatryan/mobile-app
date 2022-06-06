import 'dart:async';
import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/category/category_model.dart';
import 'package:cursus_app/model/category_list_response/category_list_response.dart';
import 'package:cursus_app/model/root_category/root_category_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceRepository {
  final dio = GetIt.I<Dio>();

  //**Service Search**//

  Future<List<ServiceModel>> search(
      {required String searchKeyword, int? id}) async {
    try {
      Map<String, dynamic> queryParams = {};
      final response = await dio
          .post('/v1/service/search', queryParameters: queryParams, data: {
        "categoryId": id ?? '',
        "term": searchKeyword,
      });
      List serviceJsons = response.data['result'];
      return serviceJsons.map((json) => ServiceModel.fromJson(json)).toList();
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        throw BadRequestException(
          message: e.response!.data!['message'],
        );
      }
      if (is500StatusCodeFamily(e.error)) {
        throw ServerException();
      }
      throw UnknownException();
    }
  }

  Future<List<CategoryModel>> searchInCategories(
      {required String searchKeyword,
      required int offset,
      required int limit,
      int? id}) async {
    try {
      Map<String, dynamic> queryParams = {
        'offset': offset,
        'limit': limit,
      };
      final response = await dio
          .post('/v1/category/search', queryParameters: queryParams, data: {
        "categoryId": id ?? '',
        "term": searchKeyword,
      });
      List data = response.data['result']['categories'];
      List<CategoryModel> categoryList = data
          .map((json) => CategoryModel.fromJson(json))
          .toList()
          .cast<CategoryModel>();

      print('xxxxxxx ${categoryList.length}');

      return categoryList;
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        throw BadRequestException(
          message: e.response!.data!['message'],
        );
      }
      if (is500StatusCodeFamily(e.error)) {
        throw ServerException();
      }
      throw UnknownException();
    }
  }

  //**Get root categories**//

  Future<List<RootCategoryModel>> getRootCategories() async {
    try {
      final response = await dio.get(
        'v1/category/root',
      );
      final List<RootCategoryModel> rootCategoryList = response.data['result']
          .map((json) => RootCategoryModel.fromJson(json))
          .toList()
          .cast<RootCategoryModel>();
      return rootCategoryList;
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        throw BadRequestException(
          message: e.response!.data!['message'],
        );
      }
      if (is500StatusCodeFamily(e.error)) {
        throw ServerException();
      }
      throw UnknownException();
    }
  }

  //**Get categories by ID**//

  Future<CategoryModel> getCategoriesById(int id) async {
    try {
      final response = await dio.get(
        'v1/category/$id',
      );
      final CategoryModel categoryModel =
          CategoryModel.fromJson(response.data['result']);
      print('oooooop $categoryModel');
      return categoryModel;
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        throw BadRequestException(
          message: e.response!.data!['message'],
        );
      }
      if (is500StatusCodeFamily(e.error)) {
        throw ServerException();
      }
      throw UnknownException();
    }
  }

  Future<List<CategoryModel>> getCategoriesWithServices({
    required int offset,
    required int limit,
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        'offset': offset,
        'limit': limit,
      };
      final response = await dio.get(
        '/public/category?with_service=true',
        queryParameters: queryParams,
      );
      final List categoriesJson = response.data['result'];
      return categoriesJson
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        throw BadRequestException(
          message: e.response!.data!['message'],
        );
      }
      if (is500StatusCodeFamily(e.error)) {
        throw ServerException();
      }
      throw UnknownException();
    }
  }
}
