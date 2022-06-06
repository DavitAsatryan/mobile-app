import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cursus_app/helpers/auth_helpers.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/intro/intro_state.dart';
import 'package:cursus_app/store/notification/notification_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../constants/theme/app_theme.dart';
import '../../helpers/storage_helper.dart';
import '../../router.gr.dart';
import '../../store/dashboard/dashboard_state.dart';
import '../../values/values.dart';
import '../widgets/buttons/main_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  DashboardState dashboardState = GetIt.I<DashboardState>();
  IntroState introState = IntroState();

  @override
  void initState() {
    super.initState();
    introState.checkLoginStatus(context);
    // initializeFirebaseService();
    // AwesomeNotifications()
    //     .actionStream
    //     .listen((ReceivedNotification receivedNotification) async {
    //   print('eeekkkkkkkkeeeee');
    //
    //   await AutoRouter.of(context).replace(const DashboardRoute());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Observer(
        builder: (context) => Center(
          child: introState.storeState.state == StoreStates.loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/logo_with_text.svg'),
                    SizedBox(
                      height: 100,
                    ),
                    CircularProgressIndicator(
                      color: AppColors.purpleDark,
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SvgPicture.asset(
                          'assets/icons/logo_with_text.svg',
                        ),
                      ),
                      Text(
                        'keywords.welcome'.tr(),
                        style: Styles.boldTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'keywords.introText'.tr(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        'assets/illustrations/ic_intro_doctor.png',
                        height: screenHeight(context) * .4,
                        //  fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                          label: 'keywords.getStarted',
                          callback: () async {
                            await StorageHelper.setSlidersSeenStatus(true);
                            await AutoRouter.of(context)
                                .replace(AuthorizationRoute());
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.language,
                            color: AppColors.anotherPurple,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Observer(
                            builder: (_) => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                style: const TextStyle(
                                  color: textBlueColor,
                                  fontSize: 16,
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: textBlueColor,
                                ),
                                isDense: true,
                                hint: Text(
                                  dashboardState.selectedLanguage ??
                                      'keywords.language'.tr(),
                                  style: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                value: dashboardState.selectedLanguage,
                                items: Lists.languages.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: AppColors.textColor),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (language) {
                                  dashboardState.selectedLanguage = language;
                                  if (language == Lists.languages[0]) {
                                    context.setLocale(const Locale('en', 'US'));
                                    StorageHelper.setLanguage('en_US');
                                  } else if (language == Lists.languages[1]) {
                                    context.setLocale(const Locale('ru', 'RU'));
                                    StorageHelper.setLanguage('ru_RU');
                                  } else {
                                    context.setLocale(const Locale('hy', 'HY'));
                                    StorageHelper.setLanguage('hy_AM');
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

// Future<void> initializeFirebaseService() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   String firebaseAppToken = await messaging.getToken(
//     vapidKey: '',
//   ) ??
//       '';
//
//   if (StringUtils.isNullOrEmpty(firebaseAppToken,
//       considerWhiteSpaceAsEmpty: true)) return;
//
//   if (!mounted) {
//     _firebaseAppToken = firebaseAppToken;
//   } else {
//     setState(() {
//       _firebaseAppToken = firebaseAppToken;
//     });
//   }
//   print('Firebase token: $firebaseAppToken');
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Got a message whilst in the foreground!');
//     print('Message data: ${message.data}');
//
//     if (
//     // This step (if condition) is only necessary if you pretend to use the
//     // test page inside console.firebase.google.com
//     !StringUtils.isNullOrEmpty(message.notification?.title,
//         considerWhiteSpaceAsEmpty: true) ||
//         !StringUtils.isNullOrEmpty(message.notification?.body,
//             considerWhiteSpaceAsEmpty: true)) {
//       print('Message also contained a notification: ${message.notification}');
//
//       String? imageUrl;
//       imageUrl ??= message.notification!.android?.imageUrl;
//       imageUrl ??= message.notification!.apple?.imageUrl;
//
//       Map<String, dynamic> notificationAdapter = {
//         NOTIFICATION_CONTENT: {
//           NOTIFICATION_ID: Random().nextInt(2147483647),
//           NOTIFICATION_CHANNEL_KEY: 'basic_channel',
//           NOTIFICATION_TITLE: message.notification!.title,
//           NOTIFICATION_BODY: message.notification!.body,
//           NOTIFICATION_LAYOUT:
//           StringUtils.isNullOrEmpty(imageUrl) ? 'Default' : 'BigPicture',
//           NOTIFICATION_BIG_PICTURE: imageUrl
//         }
//       };
//
//       AwesomeNotifications()
//           .createNotificationFromJsonData(notificationAdapter);
//     } else {
//       AwesomeNotifications().createNotificationFromJsonData(message.data);
//     }
//   });
// }

}
