import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:nil/nil.dart';

import '../../../values/values.dart';
import '../loading.dart';

class CommonDialog extends StatelessWidget {
  final String dialogText;
  final VoidCallback positiveCallback;
  final VoidCallback negativeCallback;

  const CommonDialog({
    required this.dialogText,
    required this.negativeCallback,
    required this.positiveCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkoutState = GetIt.I<CheckoutState>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              height: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [AppColors.purpleDark, AppColors.purpleLight],
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
                  Center(
                      child: Text(
                    dialogText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.white, fontSize: 20, height: 1.5),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  MainButton(
                    callback: () => positiveCallback(),
                    label: 'keywords.yes'.tr(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MainButton(
                    callback: () => negativeCallback(),
                    label: 'keywords.no'.tr(),
                  ),
                ],
              ),
            ),
            checkoutState.storeState.state == StoreStates.loading
                ? Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Loading(
                      color: AppColors.purpleLight,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
