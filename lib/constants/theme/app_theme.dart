import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/values.dart';

const primaryColor = Color(0xFF25292f);
const accentColor = Color(0xFF6ac610);
const calmGreen = Color(0xFF00BFA6);
const calmGreenDarker = Color(0xFF00A691);
const calmGreenDarkest = Color(0xFF008574);
const calmYellow = Color(0xFFF9A826);
const calmPurple = Color(0xFF6C63FF);
const calmBlue = Color(0xFF00B0FF);

const greyColor = Color(0xFFE6E6E6);
const navigationBarGreyColor = Color(0xFFF7F7F7);
const lightYellowColor = Color(0xFFFDEB90);
const skyBlueColor = Color(0xFFE4FEF4);
const textBlueColor = Color(0xFF286788);
const commonButtonColor = Color(0xFF66A1AE);
const signUpBlueColor = Color(0xFFEEFCF7);
const orangeColor = Color(0xFFF27111);
const brightBlueColor = Color(0xFFCDFFED);
const lightBlueColor = Color(0xFFC2D0CB);
const cottonBlue = Color(0xFFEBFDF7);
const greyTextColor = Color(0xFF707070);
const intBlue = Color(0xFF0A6CFF);

const tomatoRedColor = Color(0xFFff2300);
const errorOrangeColor = Color(0xFFFFAB00);
const peachColor = Color(0xFFFFCBC4);
const whiteColor = Color(0xFFebebeb);
const white = Color(0xFFFFFFFF);
const greenishBeige = Color(0xFFc2dc78);
const weirdGreen = Color(0xFF54df93);
const aquaMarine = Color(0xFF54dddf);
const warmGrey = Color(0xFF707070);
const darkGrey = Color(0x552B2B2B);
const greyDarken = Color(0xFF3E3E3E);
const blueyGrey = Color(0xFFa2a4af);
const paleGrey = Color(0xFFecedef);
const darkNavyColor = Color(0xFF323E48);
const lavenderGrey = Color(0xFFBCC9D7);
const blueberryGray = Color(0xFF8D9EAF);
const bitterSweet = Color(0x8D9EAFFF);

const blueGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [AppColors.white, Color(0xFFF0F7FF)],
);

const errorColor = tomatoRedColor;

MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

ThemeData buildLightTheme() => ThemeData(
      unselectedWidgetColor: orangeColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      primarySwatch: createMaterialColor(primaryColor),
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: aquaMarine, size: 15),

      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      fontFamily: 'Lato',
      textTheme: TextTheme(
        headline6: TextStyle(
            color: AppColors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato'),
        headline4: TextStyle(
            fontSize: 14,
            color: AppColors.white.withOpacity(0.8),
            fontFamily: 'Lato'),
        headline2: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
            color: Color(0xff0e0931)),
        button: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ).apply(
        fontFamily: 'Lato',
      ),
      toggleableActiveColor: primaryColor,
    );

BoxShadow boxShadow = BoxShadow(
  color: AppColors.shadowColor.withOpacity(.6),
  offset: const Offset(10, 10),
  blurRadius: 15,
);
