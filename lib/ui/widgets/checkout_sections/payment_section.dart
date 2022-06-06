import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/payment_method_selector_widget.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../credit_card_widget.dart';
import '../drop_down_icon.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  bool isOpend = false;
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: !isOpend
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'paymentMethod'.tr(),
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColors.textDarkPurpleColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentMethodSelectorWidget(),
                      DropDownIcon(
                        onPressed: () {
                          isOpend = !isOpend;
                          setState(() {});
                        },
                        isOpend: isOpend,
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'paymentMethod'.tr(),
                                style: TextStyle(
                                  fontSize: 23,
                                  color: AppColors.textDarkPurpleColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            DropDownIcon(
                              onPressed: () {
                                isOpend = !isOpend;
                                setState(() {});
                              },
                              isOpend: isOpend,
                            ),
                          ],
                        ),
                        Container(child: PaymentMethodSelectorWidget()),
                        checkoutState.cardsList.isNotEmpty
                            ? Observer(
                                builder: (_) => Flexible(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: checkoutState.cardsList.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                AppColors.textPurpleColor),
                                        child: Observer(
                                          builder: (_) => CheckboxListTile(
                                            dense: true,
                                            checkColor: AppColors.white,
                                            activeColor:
                                                AppColors.textPurpleColor,
                                            secondary: CreditCardWidget(
                                              cardModel: checkoutState
                                                  .cardsList[index],
                                            ),
                                            value:
                                                checkoutState.checkList[index],
                                            onChanged: (selected) async {
                                              for (int i = 0;
                                                  i <
                                                      checkoutState
                                                          .checkList.length;
                                                  i++) {
                                                checkoutState.checkList[i] =
                                                    false;
                                              }
                                              if (selected!) {
                                                checkoutState
                                                        .paymentMethodSelector[
                                                    0] = false;
                                                checkoutState
                                                        .paymentMethodSelector[
                                                    1] = true;
                                              }
                                              if (selected) {
                                                checkoutState
                                                        .selectedCreditCard =
                                                    checkoutState
                                                        .cardsList[index];
                                              } else {
                                                checkoutState
                                                    .selectedCreditCard = null;
                                              }

                                              checkoutState.checkList[index] =
                                                  selected;
                                              // if (selected) {
                                              //   patientState
                                              //       .selectedPatientIndex = index;
                                              // }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('noAvailableCreditCards'.tr()),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
