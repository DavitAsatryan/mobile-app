import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/values/values.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../helpers/overlay_helper.dart';
import '../../../store/loading/loading_state.dart';
import '../buttons/common_button.dart';
import '../loading.dart';
import '../text_input.dart';

class ResetPasswordCodeDialog extends StatelessWidget {
  ResetPasswordCodeDialog({
    Key? key,
  }) : super(key: key);

  final dio = GetIt.I<Dio>();
  final TextEditingController newPasswordTextController =
      TextEditingController();
  final TextEditingController activationCodeTextController =
      TextEditingController();
  final LoadingState loadingState = LoadingState();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 240,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  controller: activationCodeTextController,
                  textInputAction: TextInputAction.next,
                  hintText: 'e.g 657483',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  controller: newPasswordTextController,
                  hintText: 'Please enter new password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  horizontalPadding: 20,
                  callback: () async {
                    if (newPasswordTextController.text.length >= 6 &&
                        activationCodeTextController.text.isNotEmpty) {
                      await setNewPassword();
                      await AutoRouter.of(context).pop();
                    } else {
                      showCustomOverlayNotification(
                        color: AppColors.errorRed,
                        text: 'Credentials are not correct',
                      );
                    }
                  },
                  text: 'DONE',
                  color: commonButtonColor,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
            Visibility(
                visible: loadingState.loading,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Loading(),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> setNewPassword() async {
    loadingState.startLoading();
    try {
      await dio.post('/account/reset-password/finish', data: {
        'newPassword': newPasswordTextController.text,
        'key': activationCodeTextController.text,
      });
      showCustomOverlayNotification(
        color: orangeColor,
        text: 'Success',
      );
    } on DioError catch (e) {
      final Map<String, dynamic> map = jsonDecode(e.response!.data);
      showCustomOverlayNotification(
        color: AppColors.errorRed,
        text: map['detail'],
      );
      return Future.error(e.response!.data('detail'));
    } finally {
      loadingState.stopLoading();
    }
  }
}
