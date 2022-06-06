import 'dart:async';

import 'package:get_storage/get_storage.dart';

class Preferences {
  Preferences._();

  static const authToken = 'authToken';
  static const refreshKey = 'refreshKey';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const phone = 'phone';
  static const firebaseToken = 'firebaseToken';
  static const email = 'email';
  static const terms = 'terms';
  static const location = 'location';
  static const language = 'language';
  static const slidersSeen = 'slidersSeen';
  static const flavor = 'flavor';
  static const isAccountVerified = 'isAccountVerified';
  static const loginData = 'isAccountVerified';
  static const biometrics = 'biometrics';

}

class StorageHelper {
  static final storage = GetStorage();

  static Future<String> getUserName() async {
    return await storage.read(Preferences.firstName);
  }

  static Future<String> getUserSurname() async {
    return await storage.read(Preferences.lastName);
  }

  static Future<String?> getToken() async {
    return storage.read(Preferences.authToken);
  }

  static Future<String?> getFlavor() async {
    return storage.read(Preferences.flavor);
  }


  static Future<String> getEmail() async {
    return await storage.read(Preferences.email);
  }

  static Future<String> getTerms() async {
    return await storage.read(Preferences.terms);
  }

  static Future<String> getLocation() async {
    return await storage.read(Preferences.location);
  }

  static Future<String> getPhone() async {
    return await storage.read(Preferences.phone);
  }

  static Future<String> getLanguage() async {
    return await storage.read(Preferences.language) ?? '';
  }

  static Future<bool> getSlidersSeenStatus() async {
    return await storage.read(Preferences.slidersSeen) ?? false;
  }

  static Future<String> getRefreshKey() async {
    return await storage.read(Preferences.refreshKey) ?? '';
  }

  static Future<Map<String, dynamic>?> getLoginData() async {
    return await storage.read(Preferences.loginData);
  }

  static Future<bool> getBiometrics() async {
    return await storage.read(Preferences.biometrics) ?? false;
  }

  static Future<void> setBiometrics(bool biometrics) async =>
      storage.write(Preferences.biometrics, biometrics);

  static Future<void> setSlidersSeenStatus(bool status) async =>
      storage.write(Preferences.slidersSeen, status);

  static Future<void> setLocation(String location) async =>
      storage.write(Preferences.location, location);

  static Future<void> setTerms(String terms) async =>
      storage.write(Preferences.terms, terms);

  static Future<void> setFlavor(String terms) async =>
      storage.write(Preferences.flavor, terms);

  static Future<void> setUserName(String firstName) async =>
      storage.write(Preferences.firstName, firstName);

  static Future<void> setLanguage(String code) async =>
      storage.write(Preferences.language, code);

  static Future<void> setUseSurname(String lastName) async =>
      storage.write(Preferences.lastName, lastName);

  static Future<void> setPhoneNumber(String phone) async =>
      storage.write(Preferences.phone, phone);

  static Future<void> setEmail(String email) async =>
      storage.write(Preferences.email, email);

  static Future<void> setToken(String token) async =>
      storage.write(Preferences.authToken, token);

  static Future<void> setRefreshKey(String refreshKey) async =>
      storage.write(Preferences.refreshKey, refreshKey);

  static Future<void> setLoginData(Map<String, dynamic> userData) async =>
      storage.write(Preferences.loginData, userData);

  static Future<void> removeAccessToken() async {
    await storage.remove(Preferences.authToken);
  }

  static Future<void> removeAll() async {
    await storage.erase();
  }

  static Future<bool> isLoggedIn() async {
    final accessToken = await StorageHelper.getToken();
    return accessToken != null;
  }
}
