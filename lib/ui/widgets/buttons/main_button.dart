import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/authorization/authorization_state.dart';
import 'package:cursus_app/ui/widgets/signup_section.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class MainButton extends StatefulWidget {
  final String label;
  final double? controller;
  final int? keyPage;
  final VoidCallback? callback;
  final EdgeInsets? padding;
  final AuthorizationStateErrors? errors;
  final AuthorizationState? authState;
  dynamic keyForm;
  int? numberValue;

  MainButton({
    Key? key,
    required this.label,
    this.callback,
    this.padding,
    this.authState,
    this.errors,
    this.keyForm,
    this.controller,
    this.keyPage,
    this.numberValue,
  }) : super(key: key);

  @override
  State<MainButton> createState() => MainButtonState(formKey: keyForm);
}

class MainButtonState extends State<MainButton> {
  dynamic formKey;

  MainButtonState({required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: widget.padding ?? EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth(context),
      decoration: BoxDecoration(
        gradient: widget.callback == null
            ? null
            : const LinearGradient(colors: [
                AppColors.purpleDark,
                AppColors.purpleDark,
                AppColors.purpleLight
              ]),
        borderRadius: AppRadius.primaryRadius,
      ),
      child: ClipRRect(
        borderRadius: AppRadius.primaryRadius,
        child: ElevatedButton(
          onPressed: () {
            widget.callback != null ? widget.callback!() : null;

            if (widget.controller != 0 && widget.keyPage == 1) {
              SignUpSection.validHide = true;
              if (SignUpSectionState.formKey.currentState!.validate()) {}

              setState(() {
                if (SignUpSectionState.groupValue == 0) {
                  SignUpSectionState.genderValid = true;

                  print(SignUpSectionState.genderValid);
                }

                if (SignUpSectionState.agreeValue == 0) {
                  SignUpSectionState.agreeValidOne = true;
                }
                if (SignUpSectionState.agreeValueTwo == 0) {
                  SignUpSectionState.agreeValidTwo = true;
                }
              });
            }
          },
          // : showCustomOverlayNotification(
          //     color: AppColors.errorRed,
          //     text: 'wowwoo',
          //   ),
          style: widget.callback == null
              ? null
              : ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }

  void showCustomOverlayNotification({
    required Color color,
    required String text,
    Key? key,
    Duration duration = const Duration(seconds: 3),
  }) {
    showOverlayNotification(
      (context) => SafeArea(
        child: GestureDetector(
          onVerticalDragStart: (_) {
            OverlaySupportEntry.of(context)!.dismiss();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: greenishBeige.withOpacity(0.3),
                    blurRadius: 30, // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: SizedBox(
                    width: screenWidth(context) * 0.8,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: white),
                    ).tr(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      duration: duration,
      key: key,
    );
  }
}
