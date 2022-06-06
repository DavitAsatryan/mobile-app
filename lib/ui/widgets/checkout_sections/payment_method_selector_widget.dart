import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../cursus_icons.dart';

class PaymentMethodSelectorWidget extends StatefulWidget {
  const PaymentMethodSelectorWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodSelectorWidgetState createState() =>
      _PaymentMethodSelectorWidgetState();
}

class _PaymentMethodSelectorWidgetState
    extends State<PaymentMethodSelectorWidget> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Wrap(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: AppColors.textPurpleColor),
            child: Observer(
              builder: (_) => CheckboxListTile(
                dense: true,
                checkColor: AppColors.white,
                activeColor: AppColors.textPurpleColor,
                secondary: Icon(
                  CursusIcons.cash,
                  size: 20,
                ),
                title: Text(
                  'cash'.tr(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                value: checkoutState.paymentMethodSelector[0],
                onChanged: (selected) async {
                  checkoutState.paymentMethodSelector[0] = true;
                  checkoutState.paymentMethodSelector[1] = false;
                  for (int i = 0; i < checkoutState.checkList.length; i++) {
                    checkoutState.checkList[i] = false;
                  }
                  checkoutState.selectedCreditCard = null;
                },
              ),
            ),
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: AppColors.textPurpleColor),
            child: Observer(
              builder: (_) => CheckboxListTile(
                dense: true,
                checkColor: AppColors.white,
                activeColor: AppColors.textPurpleColor,
                secondary: Icon(
                  CursusIcons.credit_card,
                  size: 28,
                ),
                title: Text(
                  'creditCard'.tr(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                value: checkoutState.paymentMethodSelector[1],
                onChanged: (selected) async {
                  checkoutState.paymentMethodSelector[1] = true;
                  checkoutState.paymentMethodSelector[0] = false;

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
