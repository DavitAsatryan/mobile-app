import 'dart:async';

import 'package:cursus_app/data/repository/authorization_repository.dart';
import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/model/about_us_model/about_us_model.dart';
import 'package:cursus_app/model/help_response_model/help_response_model.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository/dashboard_repository.dart';
import '../loading/loading_state.dart';

part 'dashboard_state.g.dart';

class DashboardState = _DashboardState with _$DashboardState;

abstract class _DashboardState with Store {
  final loadingState = LoadingState();
  final dashboardRepository = DashboardRepository();
  final authenticationRepository = AuthenticationRepo();
  StoreState storeStates = StoreState();

  Observable<UserModel?> _currentUser = Observable<UserModel?>(null);
  @observable
  String? selectedLanguage;

  @computed
  UserModel get currentUser => _currentUser.value!;

  @computed
  set currentUser(currentUser) => _currentUser.value = currentUser;

  @observable
  bool userHasToken = false;

  @observable
  AboutUsModel? aboutUsModel;

  @observable
  LatLng? coordinates;

  @observable
  ObservableList<HelpResponseModel> helpResponseList =
      <HelpResponseModel>[].asObservable();

  @action
  Future<void> refreshTokenPeriodically() async {
    await authenticationRepository.refreshToken();
    Timer.periodic(
      const Duration(minutes: 8),
      (timer) async {
        await authenticationRepository.refreshToken();
      },
    );
  }

  @action
  Future<void> refreshToken() async {
    await authenticationRepository.refreshToken();
  }

  @action
  Future<void> getAboutUs() async {
    try {
      storeStates.changeState(StoreStates.loading);
      aboutUsModel = await dashboardRepository.getOrgAddress();
      List<String> splitString =
          aboutUsModel!.contactGeocoordinates.split(', ');
      coordinates = LatLng(
          double.parse(splitString.first), double.parse(splitString.last));

      storeStates.changeState(StoreStates.success);
    } catch (e) {
      storeStates.setErrorMessage(e.toString());
      storeStates.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> sendMessage(BuildContext context, String name, String phone,
      String email, String message) async {
    try {
      storeStates.changeState(StoreStates.loading);
      await dashboardRepository.sendMessage(name, phone, email, message);
      storeStates.changeState(StoreStates.success);
      showCustomOverlayNotification(
        color: AppColors.purpleLight,
        text: 'success'.tr(),
      );
    } catch (e) {
      showCustomOverlayNotification(
        color: AppColors.purpleLight,
        text: 'wrong'.tr(),
      );
      storeStates.setErrorMessage(e.toString());
      storeStates.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> getHelpQuestions() async {
    try {
      storeStates.changeState(StoreStates.loading);
      final res = await dashboardRepository.getHelpQuestions();
      helpResponseList.clear();
      for (int i = 0; i < res.length; i++) {
        HelpResponseModel helpResponseModel = HelpResponseModel(
            name: res[i].name, children: res[i].children, isOpen: false);
        helpResponseList.add(helpResponseModel);
      }
      print('dashboardSTate ${helpResponseList.length}');

      storeStates.changeState(StoreStates.success);
    } catch (e) {
      storeStates.setErrorMessage(e.toString());
      storeStates.changeState(StoreStates.error);
    }
  }
}
