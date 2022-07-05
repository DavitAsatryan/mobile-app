import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:cursus_app/data/repository/firebase_auth.dart';
import 'package:cursus_app/helpers/auth_helpers.dart';
import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:cursus_app/store/notification/notification_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/signup_section.dart';
import 'package:cursus_app/values/values.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/regexp.dart';
import '../../data/repository/authorization_repository.dart';
import '../../formatters.dart';
import '../../helpers/storage_helper.dart';

part 'authorization_state.g.dart';

class AuthorizationState = _AuthorizationState with _$AuthorizationState;

abstract class _AuthorizationState with Store {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  final FirebaseAuthentication firebaseAuthentication =
      FirebaseAuthentication();
  final StoreState storeState = StoreState();
  final DashboardState dashboardState = GetIt.I<DashboardState>();

  final AuthorizationStateErrors errors = AuthorizationStateErrors();
  NotificationState notificationState = NotificationState();

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String phoneNumber = '';

  @observable
  String password = '';

  @observable
  String gender = '';

  @observable
  String phoneNumberLogin = '';

  @observable
  String passwordLogin = '';

  @observable
  String? userVerifyToken;

  @observable
  bool agreedToSmsNotification = false;

  @observable
  bool agreedToTermsAndConditions = false;

  String _firebaseAppToken = '';

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setPassword(String value) {
    password = value.trim();
  }

  @action
  void setPhoneNumber(String value) {
    phoneNumber = value.trim();
  }

  @action
  void setGender(String value) {
    gender = value.trim();
  }

  @action
  void setAgreedToSmsNotification() {
    agreedToSmsNotification = !agreedToSmsNotification;
  }

  @action
  void setAgreedToTermsAndConditions() {
    agreedToTermsAndConditions = !agreedToTermsAndConditions;
  }

  @action
  void validateFirstName(_) {
    final fname = firstName.trim();
    if (fname.isEmpty || fname.length < 3) {
      errors.firstName = 'localValidationErrors.firstNameValidate'.tr();
    } else {
      errors.firstName = null;
    }
  }

  @action
  void validateLastName(_) {
    final lname = lastName.trim();
    if (lname.isEmpty || lname.length < 5) {
      errors.lastName = 'localValidationErrors.lastNameValidate'.tr();
    } else {
      errors.lastName = null;
    }
  }

  @action
  void validatePassword(_) {
    final password = this.password.trim();
    if (password.isEmpty || password.length < 7) {
      errors.password = 'Too short (more than 8)';
    } else if (!RegExp(passwordRegexp).hasMatch(password)) {
      errors.password =
          'Password must contain at least : One capital letter, one number, one symbol';
    } else {
      errors.password = null;
    }
  }

  @action
  void validatePhoneNumber(_) {
    final phoneNumber = this.phoneNumber.trim();
    if (phoneNumber.isEmpty) {
      errors.phoneNumber = 'localValidationErrors.phoneRequired'.tr();
    } else if (
        //!RegExp(phoneNumberRegexp).hasMatch(phoneNumber) ||
        phoneNumber.length < 10) {
      print(222);
      errors.phoneNumber = 'localValidationErrors.invalidPhoneNumber'.tr();
    } else {
      errors.phoneNumber = null;
    }
  }

  @action
  void validateGender(_) {
    final gender = this.gender.trim();
    if (SignUpSectionState.groupValue == 0) {
      errors.gender = 'localValidationErrors.gender'.tr();
    }
  }

  @action
  void validatePhoneNumberLogin(_) {
    final phoneNumberLogin = this.phoneNumberLogin.trim();
    print(phoneNumberLogin);
    if (phoneNumberLogin.isEmpty) {
      errors.phoneNumberLogin = 'localValidationErrors.phoneRequired'.tr();
    } else if (
        //!RegExp(phoneNumberRegexp).hasMatch(phoneNumberLogin) ||
        phoneNumberLogin.length < 10) {
      errors.phoneNumberLogin = 'localValidationErrors.invalidPhoneNumber'.tr();
    } else {
      errors.phoneNumberLogin = null;
    }
  }

  @action
  void validatePasswordLogin(_) {
    final passwordLogin = this.passwordLogin.trim();
    if (passwordLogin.isEmpty) {
      errors.passwordLogin = 'Incorrect length';
    } else if (!RegExp(passwordRegexp).hasMatch(passwordLogin)) {
      errors.passwordLogin =
          'Password must contain at least : One capital letter, one number, one symbol';
    } else {
      errors.passwordLogin = null;
    }
  }

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => phoneNumber, validatePhoneNumber),
      reaction((_) => password, validatePassword),
      reaction((_) => gender, validateGender),
      reaction((_) => phoneNumberLogin, validatePhoneNumberLogin),
      reaction((_) => passwordLogin, validatePasswordLogin),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateLogin() {
    validatePasswordLogin(passwordLogin);
    validatePhoneNumberLogin(phoneNumberLogin);
  }

  void validateSignup() {
    validatePassword(password);
    validatePhoneNumber(phoneNumber);
    validateFirstName(firstName);
    validateLastName(lastName);
    validateLastName(gender);
  }

  @action
  Future<void> logout() async {
    //  await StorageHelper.removeAccessToken();
    //  await StorageHelper.removeAll();
  }

  @action
  Future<void> logIn(BuildContext context) async {
    if (!errors.loginHasErrors) {
      try {
        storeState.changeState(StoreStates.loading);
        phoneNumber = '+374${maskFormatter.getUnmaskedText()}';
        String? deviceId = await getDeviceId();
        if (deviceId != null) {
          final transformedNumber = formatPhoneNumber(phoneNumber);
          final result = await authenticationRepo.login(
            transformedNumber.trim(),
            passwordLogin.trim(),
            deviceId,
          );
          Map<String, dynamic> loginData = {
            'username': phoneNumber,
            'password': passwordLogin,
            'deviceId': deviceId,
          };
          await StorageHelper.setLoginData(loginData);
          await StorageHelper.setToken(result.jwtToken);
          await StorageHelper.setRefreshKey(result.refreshKey);

          await initializeFirebaseService();
          await notificationState.sendFCM(_firebaseAppToken, deviceId);
          storeState.changeState(StoreStates.success);
          await AutoRouter.of(context).replace(const DashboardRoute());
        } //error alert
      } on Exception catch (e) {
        storeState.changeState(StoreStates.error);
        showCustomOverlayNotification(
          color: AppColors.errorRed,
          text: e.toString(),
        );
      }
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

      if (!StringUtils.isNullOrEmpty(message.notification?.title) ||
          !StringUtils.isNullOrEmpty(
            message.notification?.body,
          )) {
        print('Message also contained a notification: ${message.notification}');

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
      } else {
        AwesomeNotifications().createNotificationFromJsonData(message.data);
      }
    });
  }

  Future loginWithGoogle() async {
    // UserCredential userCredential =
    //     await firebaseAuthentication.signInWithGoogle();
    // await authenticationRepo.signUpWithGoogle(
    //   userCredential.user!.displayName!,
    //   userCredential.user!.displayName!,
    //   'asd',
    // );
  }

  Future loginWithFacebook() async {
    //   await firebaseAuthentication.signInWithFacebook();
  }

  Future<void> refreshToken() async {
    await authenticationRepo.refreshToken();
  }

  @action
  Future<UserModel?> register(BuildContext context) async {
    if (!errors.registerationHasErrors &&
        agreedToSmsNotification &&
        agreedToTermsAndConditions) {
      final phone = '+374${maskFormatter.getUnmaskedText()}';
      try {
        storeState.changeState(StoreStates.loading);
        final formattedPhoneNumber = formatPhoneNumber(phone);
        userVerifyToken = await authenticationRepo.signUp(
          firstName,
          lastName,
          formattedPhoneNumber,
          password,
          gender,
        );
        // storeState.setSuccessMessage('Successful Registration');
        storeState.changeState(StoreStates.success);

        await AutoRouter.of(context).replace(VerifyOtpCodeSlide(
            phoneNumber: formattedPhoneNumber,
            userVerifyToken: userVerifyToken!));
      } on DioError catch (e) {
        if (e.response!.data['topic'] == 'phone') {
          errors.phoneNumber = '${e.response!.data['message']}';
        } else {
          storeState.setErrorMessage('${e.response!.data['message']}');
        }
        storeState.changeState(StoreStates.error);
      }
    }
    return null;
  }

  @action
  Future<void> sendOtpCodeToServer() async {}
}

class AuthorizationStateErrors = _AuthorizationStateErrors
    with _$AuthorizationStateErrors;

abstract class _AuthorizationStateErrors with Store {
  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? password;

  @observable
  String? gender;

  @observable
  String? phoneNumber;

  @computed
  bool get registerationHasErrors =>
      firstName != null ||
      lastName != null ||
      password != null ||
      phoneNumber != null ||
      gender != null;

  @observable
  String? phoneNumberLogin;

  @observable
  String? passwordLogin;

  @computed
  bool get loginHasErrors => phoneNumberLogin != null || passwordLogin != null;
}
