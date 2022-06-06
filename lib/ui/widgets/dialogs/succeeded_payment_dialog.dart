import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../router.gr.dart';
import '../buttons/common_button.dart';

class SucceededPaymentDialog extends StatelessWidget {
  const SucceededPaymentDialog({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Congratulations',
              style: TextStyle(
                  fontSize: 18,
                  color: orangeColor,
                  fontWeight: FontWeight.w700),
            ),
            const Text('Your subscription is active'),
            const SizedBox(
              height: 50,
            ),
            CommonButton(
              horizontalPadding: 20,
              callback: () =>
                  AutoRouter.of(context).replace(const AuthorizationRoute()),
              text: 'LOGIN',
              color: orangeColor,
            )
          ],
        ),
      ),
    );
  }
}
