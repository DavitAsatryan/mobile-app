import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/theme/app_theme.dart';
import '../../../helpers/overlay_helper.dart';
import '../buttons/common_button.dart';
import '../text_input.dart';

class ChangePasswordDialog extends StatelessWidget {
  ChangePasswordDialog({
    Key? key,
  }) : super(key: key);

  final dio = GetIt.I<Dio>();
  final TextEditingController oldPasswordTextController =
      TextEditingController();
  final TextEditingController newPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInput(
              controller: oldPasswordTextController,
              textInputAction: TextInputAction.next,
              hintText: 'Please enter your last password',
            ),
            const SizedBox(
              height: 20,
            ),
            TextInput(
              controller: newPasswordTextController,
              textInputAction: TextInputAction.next,
              hintText: 'Please enter your new password',
            ),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
              horizontalPadding: 20,
              callback: () => changePassword().whenComplete(() {}),
              // ,
              text: 'Save',
              color: commonButtonColor,
            )
          ],
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    final res = await dio.post('/account/change-password/', data: {
      'currentPassword': oldPasswordTextController.text,
      'newPassword': newPasswordTextController.text,
    });
    if (res.statusCode == 200) {
      showCustomOverlayNotification(
        color: orangeColor,
        text: 'Your password is changed',
      );
    } else {
      showCustomOverlayNotification(
        color: orangeColor,
        text: 'k',
      );
    }
  }
}
