import 'dart:async';

import 'package:cursus_app/helpers/otp_code_fields.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/store/verify_account/verify_account_store.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class VerifyOtpCodeSlide extends StatefulWidget {
  final String phoneNumber;
  final String userVerifyToken;

  const VerifyOtpCodeSlide(
      {Key? key, required this.phoneNumber, required this.userVerifyToken})
      : super(key: key);

  @override
  _VerifyOtpCodeSlideState createState() => _VerifyOtpCodeSlideState();
}

class _VerifyOtpCodeSlideState extends State<VerifyOtpCodeSlide> {
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  final VerifyAccountState verifyAccountState = VerifyAccountState();

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();

    verifyAccountState.userVerifyToken = widget.userVerifyToken;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => verifyAccountState.storeState.state ==
                StoreStates.loading
            ? const Loading(
                color: Colors.transparent,
              )
            : SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenHeight(context) * .07),
                        child: SvgPicture.asset(
                            'assets/icons/logo_with_text.svg',
                            width: screenHeight(context) * .15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Verify phone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.anotherPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () =>
                            verifyAccountState
                            .resendVerifyCode(widget.phoneNumber),
                        child: const Text(
                          'Resend SMS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      OtpCodeFields(
                        controller: TextEditingController(),
                        appContext: context,
                        errorAnimationController:
                            StreamController<ErrorAnimationType>(),
                        pastedTextStyle: const TextStyle(
                          color: AppColors.yellow450,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        animationType: AnimationType.fade,
                        cursorColor: AppColors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        keyboardType: TextInputType.number,
                        onCompleted: (_) {
                          verifyAccountState.verifyAccount(
                              context);
                        },
                        onChanged: (value) {
                          verifyAccountState.setOtpCode(value);
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
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
