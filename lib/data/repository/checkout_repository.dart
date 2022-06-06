import 'dart:io';

import 'package:cursus_app/data/exceptions/dio_error_codes.dart';
import 'package:cursus_app/data/exceptions/general_exceptions.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/model/credit_card/credit_card_model.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CheckoutRepository {
  final dio = GetIt.I<Dio>();

  Future<List<String>> buyProduct(
    double latitude,
    double longitude,
    String address,
    String paymentMethod,
    int paymentSourceId,
    bool rememberCreditCard,
    List<ServiceModel> services,
    List<BundleModel> bundles,
    PatientModel patient,
    DateTime appointmentDate,
  ) async {
    try {
      final response = await dio.post('v1/order', data: {
        'latitude': latitude,
        'longitude': longitude,
        'rememberCreditCard': rememberCreditCard,
        'paymentMethod': paymentMethod,
        'paymentSourceId': paymentSourceId,
        'address': address,
        'services': services,
        'bundles': bundles,
        'patient': patient,
        'appointmentDate': appointmentDate.toString(),
      });
      return [
        response.data['result']['redirectTo'],
        response.data['result']['vendorOrderId']??''
      ];
    } on DioError catch (e) {
      return [e.response!.toString(), e.response!.toString()];
    }
  }

  Future<List<CreditCardModel>> getCards() async {
    try {
      final response = await dio.get(
        'v1/card',
      );
      final List cards = response.data['result'];
      return cards.map((json) => CreditCardModel.fromJson(json)).toList();
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

  Future<void> makeCardDefault(int id) async {
    try {
      await dio.put(
        'v1/card/$id/default',
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
    }
  }

  Future<int> getShippingPrice(double lat, double lng) async {
    try {
      final response = await dio.post('v1/order/price', data: {
        "latitude": lat,
        "longitude": lng,
      });
      int shipping = response.data['transportationDetails']['price'];
      int extraFee = response.data['extraFee'];
      return shipping + extraFee;
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

  Future<String> checkPaymentStatus(String vendorOrderId) async {
    try {
      final response = await dio.put('v1/order/payment/status', data: {
        "vendorOrderId": vendorOrderId,
      });
      return response.data['result']['payment']['status'];
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

  Future<void> deleteCard(int id) async {
    try {
      await dio.delete(
        'v1/card/$id',
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
    }
  }
}
