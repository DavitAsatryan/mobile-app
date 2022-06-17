import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/model/patient/request_patient_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PatientRepository {
  final dio = GetIt.I<Dio>();

  PatientRepository();

  Future<List<PatientModel>> getPatinets({
    required int offset,
    required int limit,
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        'offset': offset,
        'limit': limit,
      };

      final response = await dio.get(
        'v1/patient',
        queryParameters: queryParams,
      );

      final List<PatientModel> patientList = response.data['result']
          .map((json) => PatientModel.fromJson(json))
          .toList()
          .cast<PatientModel>();
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

  Future<List<PatientModel>> getPatinetsWithoutPagination() async {
    try {
      final response = await dio.get(
        'v1/patient',
      );

      final List<PatientModel> patientList = response.data['result']
          .map((json) => PatientModel.fromJson(json))
          .toList()
          .cast<PatientModel>();
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

  Future<void> updatePatient(int id, RequestPatientModel patientModel) async {
    try {
      await dio.put(
        'v1/patient/$id',
        data: patientModel.toJson(),
      );
    } on DioError {
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<PatientModel> addPatient(RequestPatientModel patientModel) async {
    try {
      final response = await dio.post(
        'v1/patient',
        data: patientModel.toJson(),
      );
      return PatientModel.fromJson(response.data['result']);
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

  Future<PatientModel> getPatientById(int id) async {
    try {
      final response = await dio.get(
        'v1/patient/$id',
      );
      return PatientModel.fromJson(response.data['result']);
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

  Future<void> deletePatient(int id) async {
    try {
      await dio.delete(
        'v1/patient/$id',
      );
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<void> uploadProfilePic(int userId, File image) async {
    try {
      var formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
          ),
        },
      );
      await dio.put(
        'v1/patient/$userId/profile-picture',
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
