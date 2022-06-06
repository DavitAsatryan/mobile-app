import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/model/about_us_model/about_us_model.dart';
import 'package:cursus_app/model/help_response_model/help_response_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DashboardRepository {
  final dio = GetIt.I<Dio>();

  Future<AboutUsModel> getOrgAddress() async {
    try {
      final response = await dio.get('public/settings/contact');
      return AboutUsModel.fromJson(response.data['result']);
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<void> sendMessage(
      String name, String phone, String email, String message) async {
    if (name.isEmpty) {
      name = await StorageHelper.getUserName();
    }
    if (phone.isEmpty) {
      phone = await StorageHelper.getPhone();
    }
    if (email.isEmpty) {
      email = await StorageHelper.getEmail();
    }
    try {
      await dio.post('public/contact-us', data: {
        "name": name,
        "email": email,
        "message": message,
        "phone": phone
      });
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<List<HelpResponseModel>> getHelpQuestions() async {
    try {
      final response = await dio.get('public/faq?groupByTopic=true');
      final List<HelpResponseModel> helpResponseList = response.data['result']
          .map((json) => HelpResponseModel.fromJson(json))
          .toList()
          .cast<HelpResponseModel>();
      print ('length ${helpResponseList.length}');
      return helpResponseList;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
