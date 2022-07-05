import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class BundleRepository {
  final dio = GetIt.I<Dio>();

  BundleRepository();

  Future<List<BundleModel>> getBundles() async {
    try {
      final response = await dio.get(
        'v1/bundle',
      );
      final List bundlesJson = response.data['result'];
      return bundlesJson.map((json) => BundleModel.fromJson(json)).toList();
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

  Future<BundleModel> getBundlesById(int id) async {
    try {
      final response = await dio.get(
        'v1/bundle/$id',
      );
      return BundleModel.fromJson(response.data['result']);
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

  Future<List<BundleModel>> search({
    required String searchKeyword,
    required int offset,
    required int limit,
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        'offset': offset,
        'limit': limit,
      };
      final response = await dio
          .post('/v1/bundle/search', queryParameters: queryParams, data: {
        "term": "$searchKeyword",
      });

      // print('hhhhhhhhhhhhh ${list.length}');
      final List bundlesJson = response.data['result'];
      return bundlesJson.map((json) => BundleModel.fromJson(json)).toList();
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
