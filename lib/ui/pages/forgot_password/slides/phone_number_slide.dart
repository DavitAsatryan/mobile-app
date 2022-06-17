import 'package:cursus_app/store/forgot_password/forgot_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../formatters.dart';
import '../../../../values/values.dart';
import '../../../widgets/text_input.dart';

class PhoneNumberSlide extends StatefulWidget {
  final ForgotPasswordState forgotPasswordState;
  final String? phoneError;

  PhoneNumberSlide({
    required this.forgotPasswordState,
    this.phoneError,
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneNumberSlide> createState() => _PhoneNumberSlideState();
}

class _PhoneNumberSlideState extends State<PhoneNumberSlide> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'enterYourPhoneNumber'.tr(),
          style: Styles.boldTextStyle,
        ),
        const SizedBox(height: 20),
        TextInput(
          onChanged: (value) {
            widget.forgotPasswordState.setPhone(value);
          },
          keyboardType: TextInputType.phone,
          inputFormatters: [maskFormatter] ,
          hintText: '(+   )__ ___ ___',
          errorText: widget.phoneError,
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
