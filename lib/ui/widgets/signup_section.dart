import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/theme/app_theme.dart';
import '../../formatters.dart';
import '../../store/authorization/authorization_state.dart';
import '../../values/values.dart';
import 'bottom_sheet_dialog/terms_and_conditions.dart';
import 'text_input.dart';

class SignUpSection extends StatelessWidget {
  SignUpSection({
    required this.authorizationState,
    Key? key,
  }) : super(key: key);

  final AuthorizationState authorizationState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('signUp'.tr(), style: Styles.boldTextStyle),
        ),
        Column(
          children: [
            Observer(
              builder: (_) => TextInput(
                onChanged: (value) => authorizationState.firstName = value,
                textInputAction: TextInputAction.next,
                hintText: 'hints.name'.tr(),
                errorText: authorizationState.errors.firstName,
              ),
            ),
            Observer(
              builder: (_) => TextInput(
                onChanged: (value) => authorizationState.lastName = value,
                textInputAction: TextInputAction.next,
                hintText: 'hints.surname'.tr(),
                errorText: authorizationState.errors.lastName,
              ),
            ),
            Observer(
              builder: (_) => TextInput(
                onChanged: (value) => authorizationState.phoneNumber = value,
                textInputAction: TextInputAction.next,
                inputFormatters: [maskFormatter],
                hintText: 'hints.phoneNumber'.tr(),
                keyboardType: TextInputType.phone,
                errorText: authorizationState.errors.phoneNumber,
              ),
            ),
            Observer(
              builder: (_) => TextInput(
                onChanged: (value) => authorizationState.password = value,
                textInputAction: TextInputAction.next,
                hasSuffix: true,
                hintText: 'hints.password'.tr(),
                errorText: authorizationState.errors.password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 8),
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Observer(
                      builder: (_) => Theme(
                        data: ThemeData(
                            unselectedWidgetColor:
                                AppColors.dashboardTextColor),
                        child: Checkbox(
                          activeColor: white,
                          checkColor: AppColors.dashboardTextColor,
                          value: authorizationState.agreedToTermsAndConditions,
                          onChanged: (_) {
                            authorizationState.setAgreedToTermsAndConditions();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Observer(
                            builder: (_) => const TermsAndConditions(),
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: 'iAgreeWith'.tr(),
                            style: TextStyle(
                                fontSize: 14, color: AppColors.blackColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'termsConditions'.tr(),
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.termsConditions,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 0),
              child: Row(
                children: [
                  Observer(
                    builder: (_) => Theme(
                      data: ThemeData(
                          unselectedWidgetColor: AppColors.dashboardTextColor),
                      child: Checkbox(
                        activeColor: white,
                        checkColor: AppColors.dashboardTextColor,
                        value: authorizationState.agreedToSmsNotification,
                        onChanged: (_) {
                          authorizationState.setAgreedToSmsNotification();
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: authorizationState.setAgreedToSmsNotification,
                      child: Text(
                        'agreeReceiveNotif'.tr(),
                        style: TextStyle(color: AppColors.blackColor),
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
