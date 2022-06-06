import 'package:cursus_app/data/repository/bundle_repository.dart';
import 'package:cursus_app/data/repository/checkout_repository.dart';
import 'package:cursus_app/data/repository/service_repository.dart';
import 'package:cursus_app/data/repository/user_repository.dart';
import 'package:cursus_app/store/bundle/bundle_state.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/personal_data_state/personal_data_state.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/dio.dart';
import '../data/repository/dashboard_repository.dart';
import '../store/dashboard/dashboard_state.dart';

void registerGetIt() {
  GetIt.I.registerLazySingleton<Dio>(initDio);

  GetIt.I.registerSingleton(DashboardState());
  GetIt.I.registerSingleton(DashboardRepository());

  GetIt.I.registerSingleton(BundleState());
  GetIt.I.registerSingleton(BundleRepository());

  GetIt.I.registerSingleton(ServiceState());
  GetIt.I.registerSingleton(ServiceRepository());

  GetIt.I.registerSingleton(CheckoutState());
  GetIt.I.registerSingleton(CheckoutRepository());

  GetIt.I.registerSingleton(PersonalDataState());
  GetIt.I.registerSingleton(UserRepository());
}

void resetGetIt() {
  GetIt.I.reset();
}