import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String? deviceId;
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    deviceId = androidInfo.androidId;
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfoPlugin.iosInfo;
    deviceId = iosInfo.identifierForVendor;
  }
  return deviceId;
}

String formatPhoneNumber(String phoneNumber) {
  if (!phoneNumber.startsWith('+')) {
    return '+$phoneNumber';
  } else {
    return phoneNumber;
  }
}
