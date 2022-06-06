import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../helpers/storage_helper.dart';

const String baseUrl = 'https://dev-api.cursus.am/';
//const String baseUrl = 'https://api.cursus.am/';

Dio initDio() {
  final options = BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 30000,
    baseUrl: baseUrl,
  );
  return Dio(options)
    ..interceptors.addAll(
      <Interceptor>[
        LogInterceptor(
            requestBody: true,
            responseBody: true,
            logPrint: (data) {
              log(data.toString(), name: 'DIO');
            }),
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await StorageHelper.getToken();
            final language = await StorageHelper.getLanguage();
            print('language   $language');
            if (token != null && token.isNotEmpty) {
              options.headers.putIfAbsent(
                  HttpHeaders.authorizationHeader, () => 'Bearer $token');
            }
            if (language.isNotEmpty) {
              options.headers.putIfAbsent('x-lang', () => language);
            } else {
              options.headers.putIfAbsent('x-lang', () => 'en_US');
            }
            return handler.next(options); //continue
          },
          onResponse: (response, handler) {
            return handler.next(response); // continue
          },
          onError: (error, handler) async {
            return handler.next(error); //continue
          },
        ),
      ],
    );
}
