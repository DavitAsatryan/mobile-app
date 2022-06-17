import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/store/address/address_state.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/patients/patients_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/delivery_section.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/patient_section.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/payment_section.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/date_picker_container.dart';
import 'package:cursus_app/ui/widgets/dialogs/comming_soon_dialog.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final checkoutState = GetIt.I<CheckoutState>();
  final AddressState addressState = AddressState();
  final PatientState patientState = PatientState();

  var dateFormat = DateFormat('dd MMMM yyyy');

  @override
  void initState() {
    super.initState();
    getInfo();
    checkoutState.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'checkout'.tr(),
        toolBarHeight: 50,
      ),
      body: Observer(
        builder: (_) => checkoutState.storeState.state == StoreStates.loading ||
                addressState.storeState.state == StoreStates.loading
            ? Loading(
                color: Colors.transparent,
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PatientSection(),
                      DeliverySection(
                        addressState: addressState,
                      ),
                      PaymentSection(),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'when'.tr(),
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.textDarkPurpleColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DatePickerContainer(
                          label: '',
                          padding: 0.0,
                          hint: '${DateTime.now().add(Duration(days: 2))}',
                          value: dateFormat.format(checkoutState.deliveryDate!),
                          onPressed: () async {
                            DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialEntryMode: DatePickerEntryMode.input,
                              initialDate:
                                  DateTime.now().add(Duration(days: 2)),
                              firstDate: DateTime.now().add(Duration(days: 2)),
                              lastDate: DateTime.now().add(Duration(days: 60)),
                            );
                            if (dateTime != null) {
                              print(dateTime);
                              checkoutState.deliveryDate = dateTime;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DatePickerContainer(
                          label: '',
                          padding: 0.0,
                          hint: checkoutState.deliveryTime!.format(context),
                          value: TimeOfDay.now().format(context),
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            if (picked != null) {
                              checkoutState.deliveryTime = picked;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'subtotal'.tr(),
                                  style: Styles.checkoutStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${formatCurrency.format(checkoutState.subTotal)}  \֏',
                                  style: Styles.checkoutPriceStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Divider(color: AppColors.dividerColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'shipping'.tr(),
                                  style: Styles.checkoutStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${formatCurrency.format(checkoutState.shipping)}  \֏',
                                  style: Styles.checkoutPriceStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Divider(color: AppColors.dividerColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'total'.tr(),
                                  style: Styles.checkoutStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${formatCurrency.format(checkoutState.subTotal + checkoutState.shipping)}  \֏',
                                  style: Styles.checkoutPriceStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MainButton(
                          callback: () {
                            String redirectTo = '';
                            checkoutState.paymentMethodSelector[0] == true ||
                                    checkoutState.selectedCreditCard != null
                                ? checkoutState.buyProduct(
                                    context, addressState.defaultAddress, false)
                                : showDialog(
                                    context: context,
                                    useRootNavigator: false,
                                    builder: (context) => CommonDialog(
                                          positiveCallback: () async {
                                            redirectTo =
                                                await checkoutState.buyProduct(
                                                    context,
                                                    addressState.defaultAddress,
                                                    true);
                                            await AutoRouter.of(context).pop();
                                          },
                                          dialogText:
                                              'rememberCardQuestion'.tr(),
                                          negativeCallback: () async {
                                            redirectTo =
                                                await checkoutState.buyProduct(
                                                    context,
                                                    addressState.defaultAddress,
                                                    false);
                                            await AutoRouter.of(context).pop();
                                          },
                                        ));
                          },
                          label: 'checkout'.tr() +
                              ' (${formatCurrency.format(checkoutState.subTotal + checkoutState.shipping)}\ ֏)'),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> getShippingPrice() async {
    checkoutState.getShippingPrice(addressState.defaultAddress.latitude!,
        addressState.defaultAddress.longitude!);
    checkoutState.getSubtotal();
  }

  Future<void> getInfo() async {
    await addressState.getAddresses();
    getShippingPrice();
  }
}
