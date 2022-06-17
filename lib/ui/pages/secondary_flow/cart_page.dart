import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  void initState() {
    super.initState();
    checkoutState.getSubtotal();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: AppColors.lightGrey,
        )),
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/illustrations/ill_back.png',
              fit: BoxFit.fitHeight,
            )),
        Scaffold(
          appBar: CustomAppBar(
            toolBarHeight: 50,
            title: 'keywords.cart'.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 10,
                  child: Observer(
                    builder: (_) => checkoutState.checkoutList.isEmpty
                        ? Center(
                            child: Text(
                              'emptyCart'.tr(),
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : ListView.builder(
                            itemCount: checkoutState.checkoutList.length,
                            itemBuilder: (listContext, index) {
                              return Container(
                                height: 80,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: checkoutState
                                                    .checkoutList[index].icon ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/icons/ic_default.svg')
                                            : Image.network(
                                                '$baseUrl${checkoutState.checkoutList[index].icon}'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              checkoutState
                                                  .checkoutList[index].name,
                                              style: Styles.mainTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                      fontSize: 18),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            child: Icon(Icons.clear),
                                            onTap: () async {
                                              int id = checkoutState
                                                  .checkoutList[index].id;
                                              checkoutState.serviceList.any(
                                                      (element) =>
                                                          element.id == id)
                                                  ? checkoutState.serviceList
                                                      .removeWhere((element) =>
                                                          id == element.id)
                                                  : checkoutState.bundleList
                                                      .removeWhere((element) =>
                                                          id == element.id);

                                              await checkoutState.checkoutList
                                                  .removeAt(index);
                                              checkoutState.getSubtotal();
                                            }),
                                        Text(
                                          '${formatCurrency.format(checkoutState.checkoutList[index].price)}  \֏',
                                          style: Styles.mainTextStyle.copyWith(
                                              color: AppColors.black,
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                    ),
                                  ],
                                ),
                              );
                            }),
                  ),
                ),
                Observer(
                  builder: (_) => checkoutState.storeState.state ==
                          StoreStates.loading
                      ? Loading(
                          color: Colors.transparent,
                        )
                      : Visibility(
                          visible: checkoutState.checkoutList.isNotEmpty,
                          child: Wrap(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MainButton(
                              callback: () =>
                                  AutoRouter.of(context).push(CheckoutRoute()),
                              label: 'checkout'.tr(),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                          ]),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
