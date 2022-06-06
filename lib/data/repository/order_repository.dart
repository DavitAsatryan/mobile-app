import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/order/order_details_model.dart';
import 'package:cursus_app/model/order/order_model.dart';
import 'package:cursus_app/ui/pages/main_navigation/orders_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class OrderRepository {
  final dio = GetIt.I<Dio>();

  OrderRepository();

  Future<List<OrderModel>> getOrdersByType({
    required OrderType orderType,
    required int offset,
    required int limit,
  }) async {
    try {
      final queryParam = {
        'offset': offset,
        'limit': limit,
      };
      final type = describeEnum(orderType);
      final result = await dio.get(
        'v1/order/$type',
        queryParameters: queryParam,
      );
      final List list = result.data['result'];
      List<OrderModel> orders =
          list.map((json) => OrderModel.fromJson(json)).toList();
      return orders;
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
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

  Future<void> cancelOrder(int id) async {
    try {
      final result = await dio.put(
        'v1/order/$id/cancel',
      );
     // return OrderDetailsModel.fromJson(result.data);
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
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

  Future<OrderDetailsModel> getOrdersDetails(int id) async {
    try {
      final result = await dio.get(
        'v1/order/$id',
      );

      return OrderDetailsModel.fromJson(result.data['result']);
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
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
