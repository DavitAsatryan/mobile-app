import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/notification_model/notification_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class NotificationRepository {
  final dio = GetIt.I<Dio>();

  Future<List<NotificationModel>> getNotifications({
    required int offset,
    required int limit,
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        'offset': offset,
        'limit': limit,
      };
      final response = await dio.get(
        'v1/notification',
        queryParameters: queryParams,
      );
      final List<NotificationModel> patientList = response.data['result']
          .map((json) => NotificationModel.fromJson(json))
          .toList()
          .cast<NotificationModel>();
      return patientList;
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
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<void> markAsRead(int id) async {
    try {
      await dio.post('v1/notification/acknowledge/$id');
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

  Future<void> sendFCM(String FCM, String deviceID) async {
    try {
      await dio.post('v1/device/register', data: {'fcmToken': FCM, 'deviceId': deviceID});
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

  Future<void> markAllAsRead() async {
    try {
      await dio.post('v1/notification/acknowledge/all');
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
