
import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/values/values.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/regexp.dart';

class ServiceAddedDialog extends StatefulWidget {
  const ServiceAddedDialog({
    Key? key,
  }) : super(key: key);

  @override
  _ServiceAddedDialogState createState() => _ServiceAddedDialogState();
}

class _ServiceAddedDialogState extends State<ServiceAddedDialog> {
  final dio = GetIt.I<Dio>();

  TextEditingController emailTextController = TextEditingController();

  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.purpleDark,
                    AppColors.purpleLight,
                  ],
                )),
          ),
          Positioned.fill(
              child: Image.asset(
            'assets/images/dialog_background.png',
            scale: 1,
            fit: BoxFit.cover,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 270,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  'Service Added to \n Your Card',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white, fontSize: 20, height: 1.5),
                )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withOpacity(.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/icons/ic_check.svg',
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.grey150,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        'Back To Services page',
                        style: Styles.boldTextStyle
                            .copyWith(color: AppColors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () async {
                    await AutoRouter.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: Styles.boldTextStyle
                        .copyWith(color: AppColors.grey150, fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> resetPassword(String email) async {
    await dio.post('/mobile/reset-password/init', data: {
      'email': email,
    });
  }

  void validateEmail(_) {
    setState(() {
      final email = emailTextController.text.trim();
      if (email.isEmpty) {
        emailError = "Email can't be empty";
      } else if (!RegExp(emailRegExp).hasMatch(email)) {
        emailError = 'Invalid email address';
      } else {
        emailError = null;
      }
    });
  }
}
