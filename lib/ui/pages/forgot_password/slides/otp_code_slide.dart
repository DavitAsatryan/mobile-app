import 'dart:async';

import 'package:cursus_app/helpers/otp_code_fields.dart';
import 'package:cursus_app/store/forgot_password/forgot_password.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';

class OtpCodeSlide extends StatefulWidget {
  final ForgotPasswordState forgotPasswordState;
  final PageController pageController;

  OtpCodeSlide({
    required this.forgotPasswordState,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpCodeSlide> createState() => _OtpCodeSlideState();
}

class _OtpCodeSlideState extends State<OtpCodeSlide> {
  late TextEditingController controller;
  late StreamController<ErrorAnimationType> errorController;
  late ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    reactionDisposer = autorun((_) {
      final pageState = widget.forgotPasswordState.storeState;
      if (pageState.state == StoreStates.error) {
        if (pageState.errorMessage == 'user_verify_key_error') {
          errorController.add(ErrorAnimationType.shake);
          controller.clear();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Column(
        children: [
          Text(
            'otp_code_text'.tr(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => widget.forgotPasswordState.sendOtpCode(),
            child: Text(
              'sendSmsAgain'.tr(),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          OtpCodeFields(
            controller: controller,
            appContext: context,
            pastedTextStyle: const TextStyle(
              color: AppColors.yellow450,
              fontWeight: FontWeight.bold,
            ),
            length: 6,

            animationType: AnimationType.fade,
            errorAnimationController: errorController,
            cursorColor: AppColors.black,
            animationDuration: const Duration(milliseconds: 300),
            keyboardType: TextInputType.number,
            onCompleted: (_) {
              widget.pageController.animateToPage(
                2,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            onChanged: (value) {
              widget.forgotPasswordState.setOtp(value);
            },
            beforeTextPaste: (text) {
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
