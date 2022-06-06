import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


class RegistrationRepository {
  final dio = GetIt.I<Dio>();



  Future<String> getTerms() async {
    final res = await dio.get('/contents/terms');
    return res.data['value'];
  }

  // Future<List<SchoolModel>> getLocations() async {
  //   try {
  //     final res = await dio.get(
  //       '/locations/simple',
  //     );
  //     final locations = res.data
  //         .map((i) => SchoolModel.fromJson(i))
  //         .toList()
  //         .cast<SchoolModel>();
  //     return locations;
  //   } on DioError catch (e) {
  //     return Future.error(e.response!.data['message']);
  //   }
  // }
}
