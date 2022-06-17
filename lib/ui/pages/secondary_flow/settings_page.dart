import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = true;
  String? _chosenValue;
  bool isBiometricsOnn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitialLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.settings',
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        toolBarHeight: 60,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              DropdownButton<String>(
                isDense: true,
                isExpanded: true,
                focusColor: Colors.white,
                value: _chosenValue,
                underline: nil,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: Lists.languages.map((value) {
                  return DropdownMenuItem<String>(
                    // alignment: Alignment.bottomCenter,
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.darkBlackColor),
                    ),
                  );
                }).toList(),
                onChanged: (language) {

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
                  setState(() {
                    _chosenValue = language;
                  });
                 },

              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'keywords.notifications',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.darkBlackColor),
                  ).tr(),
                  CupertinoSwitch(
                    activeColor: AppColors.textDarkPurpleColor,
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'biometrics'.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.darkBlackColor),
                  ),
                  CupertinoSwitch(
                    activeColor: AppColors.textDarkPurpleColor,
                    value: isBiometricsOnn,
                    onChanged: (value) {
                      setState(() {
                        isBiometricsOnn = value;
                        StorageHelper.setBiometrics(value);
                        showCustomOverlayNotification(
                            color: AppColors.purpleLight,
                            text:
                                'Biometric authentication is ${isBiometricsOnn == true ? ' activated' : ' off'}');
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getInitialLanguage() async {
    String locale = await StorageHelper.getLanguage();
    if (locale == 'hy_AM') {
      _chosenValue = Lists.languages[2];
    } else if (locale == 'ru_RU') {
      _chosenValue = Lists.languages[1];
    } else {
      _chosenValue = Lists.languages[0];
    }
    setState(() {});
  }
}
