import 'dart:async';
import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/model/login_response/login_result.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AuthenticationRepo {
  final dio = GetIt.I<Dio>();

  Future<LoginResult> login(
    String phoneNumber,
    String password,
    String deviceId,
  ) async {
    try {
      final data = {
        'username': phoneNumber,
        'password': password,
        'deviceId': deviceId,
        'rememberMe': true
      };
      final response = await dio.post(
        '/public/auth/login',
        data: data,
      );
      final loginResult = LoginResult(
        jwtToken: response.data['result']['jwtToken'],
        refreshKey: response.data['result']['refreshKey'],
      );
      return loginResult;
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

  Future<String> signUp(
    String firstName,
    String lastName,
    String phoneNumber,
    String password,
    String gender,
  ) async {
    try {
      final data = {
        'firstName': firstName,
        'lastName': lastName,
        'phone': phoneNumber,
        'password': password,
        'verifyBy': 'sms',
        'gender': gender,
      };
      final result = await dio.post('/public/auth/register', data: data);
      return result.data['userVerifyToken'];
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<String> signUpWithGoogle(
    String firstName,
    String lastName,
    String token,
  ) async {
    try {
      final data = {
        'firstName': firstName,
        'lastName': lastName,
        // 'token': token,
        'federatedAccount': 'FederatedAccount.GOOGlE',
        // 'verifyBy': 'sms'
      };
      final result = await dio.post('/public/auth/register', data: data);
      return result.data['userVerifyToken'];
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

  Future<Response> refreshToken() async {
    try {
      final refreshToken = await StorageHelper.getRefreshKey();
      print('aaaaaaa ref $refreshToken');
      final response =
          await dio.get('/public/auth/refresh-token/$refreshToken');
      final refreshedToken = response.data['newJwtToken'];
      await StorageHelper.setToken(refreshedToken);
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<String> resendVerifyKey(String phoneNumber) async {
    try {
      final data = {'phone': phoneNumber};
      final result = await dio.post('/public/auth/resend-key', data: data);
      if (result.data['message'] != 'user_verify_key_sent') {
        throw BadRequestException(message: result.data['message']);
      }
      return result.data['userVerifyToken'];
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

  Future<String> verifyAccount(String token, key, deviceId) async {
    try {
      final data = {
        'userVerifyToken': token,
        'userVerifyKey': key,
        'deviceId': deviceId,
      };
      final res = await dio.post('/public/auth/register/verify', data: data);
      return res.data['result']['jwtToken'];
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        throw BadRequestException(
          message: 'Wrong OTP code',
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

  Future<String> forgotPassword(String phoneNumber) async {
    try {
      final data = {'phone': phoneNumber};
      final result = await dio.post('/public/auth/forgot-password', data: data);
      if (result.data['message'] == 'user_not_found') {
        throw UserNotFoundException();
      }
      return result.data['userVerifyToken'];
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
    } on UserNotFoundException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<void> resetPassword({
    required String token,
    required String key,
    required String newPassword,
  }) async {
    try {
      final data = {
        'userVerifyToken': token,
        'userVerifyKey': key,
        'newPassword': newPassword,
      };
      final result = await dio.post('/public/auth/reset-password', data: data);
      if (result.data['message'] == 'user_not_found') {
        throw UserNotFoundException();
      }
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
    } on UserNotFoundException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}
