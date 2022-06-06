import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/data/repository/authorization_repository.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:cursus_app/router.gr.dart';

part 'intro_state.g.dart';

class IntroState = _IntroState with _$IntroState;

abstract class _IntroState with Store {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  DashboardState dashboardState = GetIt.I<DashboardState>();

  final StoreState storeState = StoreState();

  Future<void> checkLoginStatus(BuildContext context) async {
    try {
      storeState.changeState(StoreStates.loading);
      final hasSeenIntroPage = await StorageHelper.getSlidersSeenStatus();

      if (hasSeenIntroPage) {
        await AutoRouter.of(context).replace(const AuthorizationRoute());
      }
      storeState.changeState(StoreStates.success);

    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }
}
