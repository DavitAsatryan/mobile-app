import 'package:flutter/material.dart' hide Router;
import 'router.gr.dart' as app_router;
import 'package:cursus_app/providers/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'constants/theme/app_theme.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  await GetStorage.init();
  await EasyLocalization.ensureInitialized();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('hy', 'HY')
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");

  // Use this method to automatically convert the push data, in case you gonna use our data standard
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

class MyApp extends StatelessWidget {
  final _appRouter = app_router.FlutterRouter();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        key: ValueKey('${context.locale}'),
        title: 'Cursus',
        theme: buildLightTheme(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
