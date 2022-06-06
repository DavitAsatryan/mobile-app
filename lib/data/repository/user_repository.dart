import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UserRepository {
  final dio = GetIt.I<Dio>();

  Future<UserModel?> getUser() async {
    try {
      final response = await dio.get('v1/me');
      return UserModel.fromJson(response.data['result']);
    } on DioError catch (e) {}
  }

  Future<void> updateUser(UserModel userModel) async {
    try {
      await dio.put(
        'v1/me',
        data: userModel.toJson(),
      );
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

  Future<void> uploadProfilePic(File image) async {
    try {
      var formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
          ),
        },
      );
      await dio.put(
        'v1/me/profile-picture',
        data: formData,
      );
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        throw NoInternetException();
      }
      if (is400StatusCodeFamily(e.error)) {
        if (e.error == DioError401) {
          throw UnauhtorizedException();
        }
        if (e.error == DioError413) {
          throw EntityTooLargeException();
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
}
