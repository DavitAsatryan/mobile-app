import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/model/shopping_cart/shipping_cart_model.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../values/values.dart';
import '../buttons/main_button.dart';

class AddToCardBottomSheet extends StatefulWidget {
  final String serviceName;
  final int price;
  String? icon;
  final int id;
  final bool isBundle;

  AddToCardBottomSheet({
    required this.serviceName,
    required this.price,
    required this.id,
    required this.isBundle,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<AddToCardBottomSheet> createState() => _AddToCardBottomSheetState();
}

class _AddToCardBottomSheetState extends State<AddToCardBottomSheet> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: .4,
            child: Image.asset(
              'assets/icons/ill_dust.png',
              scale: 1,
              fit: BoxFit.cover,
            ),
          )),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/add_to_card_background.png',
                // scale: 1,
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                widget.serviceName,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'price'.tr() + ' ',
                    style: TextStyle(color: AppColors.black400)),
                TextSpan(
                    text: '${formatCurrency.format(widget.price)}  \֏',
                    style: TextStyle(
                        color: AppColors.black400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ])),
              const SizedBox(
                height: 30,
              ),
              MainButton(
                callback: () {
                  checkoutState.checkoutList.add(ShoppingCartModel(
                      name: widget.serviceName,
                      icon: widget.icon,
                      price: widget.price,
                      id: widget.id));
                  widget.isBundle
                      ? checkoutState.bundleList.add(BundleModel(
                          id: widget.id,
                          createdAt: '',
                          description: '',
                          name: '',
                        ))
                      : checkoutState.serviceList
                          .add(ServiceModel(id: widget.id, name: ''));
                  AutoRouter.of(context).pop();
                },
                label: 'addToCard'.tr(),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => AutoRouter.of(context).pop(),
                child: Text(
                  'keywords.cancel'.tr(),
                  style: Styles.boldTextStyle.copyWith(fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
