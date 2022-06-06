import 'package:cursus_app/store/forgot_password/forgot_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../values/values.dart';
import '../../../widgets/text_input.dart';

class NewPasswordSlide extends StatelessWidget {
  final ForgotPasswordState forgotPasswordState;
  final String? passwordError;

  const NewPasswordSlide({
    required this.forgotPasswordState,
    this.passwordError,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'pleaseEnterYourNewPassword'.tr(),
            style: Styles.boldTextStyle,
          ),
        ),
        const SizedBox(height: 20),
        TextInput(
          onChanged: (value) {
            forgotPasswordState.setNewPassword(value);
          },
          textInputAction: TextInputAction.done,
          hasSuffix: true,
          hintText: 'Password',
          errorText: passwordError,
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
