import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cursus_app/data/repository/authorization_repository.dart';
import 'package:cursus_app/helpers/auth_helpers.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/store/notification/notification_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:cursus_app/router.gr.dart';

part 'verify_account_store.g.dart';

class VerifyAccountState = _VerifyAccountState with _$VerifyAccountState;

abstract class _VerifyAccountState with Store {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  final StoreState storeState = StoreState();
  String _firebaseAppToken = '';
  NotificationState notificationState = NotificationState();

  @observable
  String otpCode = '';

  @observable
  String userVerifyToken = '';

  @action
  void setOtpCode(String value) {
    otpCode = value;
  }

  @action
  Future<void> resendVerifyCode(String phoneNumber) async {
    try {
      storeState.changeState(StoreStates.loading);
      userVerifyToken = await authenticationRepo.resendVerifyKey(phoneNumber);
      storeState.changeState(StoreStates.success);
    } on Exception catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> verifyAccount(BuildContext context) async {
    try {
      storeState.changeState(StoreStates.loading);
      final deviceId = await getDeviceId();
      String jwtToken = await authenticationRepo.verifyAccount(
        userVerifyToken,
        otpCode,
        deviceId!,
      );
      await StorageHelper.setToken(jwtToken);
      storeState.setSuccessMessage('verifiedAccount'.tr());
      storeState.changeState(StoreStates.success);

      await initializeFirebaseService();
      await notificationState.sendFCM(_firebaseAppToken, deviceId);
      AutoRouter.of(context).replace(const DashboardRoute());
    } on Exception catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  Future<void> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
          vapidKey: '',
        ) ??
        '';

    // if (StringUtils.isNullOrEmpty(firebaseAppToken,
    //     considerWhiteSpaceAsEmpty: true)) return;

    print('Firebase token: $firebaseAppToken');
    // initialize firebase before actual app get start.
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _firebaseAppToken = firebaseAppToken;
    print('Firebase token: $_firebaseAppToken');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      // if (!StringUtils.isNullOrEmpty(message.notification?.title,
      //         considerWhiteSpaceAsEmpty: true) ||
      //     !StringUtils.isNullOrEmpty(message.notification?.body,
      //         considerWhiteSpaceAsEmpty: true)) {
      //   print('Message also contained a notification: ${message.notification}');

      String? imageUrl;
      imageUrl ??= message.notification!.android?.imageUrl;
      imageUrl ??= message.notification!.apple?.imageUrl;

      Map<String, dynamic> notificationAdapter = {
        NOTIFICATION_CONTENT: {
          NOTIFICATION_ID: Random().nextInt(2147483647),
          NOTIFICATION_CHANNEL_KEY: 'basic_channel',
          NOTIFICATION_TITLE: message.notification!.title,
          NOTIFICATION_BODY: message.notification!.body,
          // NOTIFICATION_LAYOUT:
          //     StringUtils.isNullOrEmpty(imageUrl) ? 'Default' : 'BigPicture',
          NOTIFICATION_BIG_PICTURE: imageUrl
        }
      };

      AwesomeNotifications()
          .createNotificationFromJsonData(notificationAdapter);
      // } else {
      //   AwesomeNotifications().createNotificationFromJsonData(message.data);
      // }
    });
  }
}
