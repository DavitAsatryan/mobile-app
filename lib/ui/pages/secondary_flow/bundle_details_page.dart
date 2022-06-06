import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/bundle/bundle_state.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/shopping_cart.dart';
import 'package:cursus_app/ui/widgets/background_gradient.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/add_to_card_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class BundleDetailsPage extends StatefulWidget {
  final int bundleId;

  const BundleDetailsPage({
    required this.bundleId,
    Key? key,
  }) : super(key: key);

  @override
  _BundleDetailsPageState createState() => _BundleDetailsPageState();
}

class _BundleDetailsPageState extends State<BundleDetailsPage> {
  BundleState bundleState = GetIt.I<BundleState>();
  CheckoutState checkoutState = GetIt.I<CheckoutState>();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future<void> getInfo() async {
    await bundleState.getBundleByID(widget.bundleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => bundleState.storeState.state == StoreStates.loading
            ? Loading(color: AppColors.grey250.withOpacity(0.3))
            : GradientContainer(
                child: Stack(
                children: [
                  Scaffold(
                    appBar: CustomAppBar(
                      title: 'keywords.bundles'.tr(),
                      titleSize: 25,
                      textAndIconColor: AppColors.white,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                    ),
                    backgroundColor: Colors.transparent,
                    resizeToAvoidBottomInset: false,
                    body: Container(
                      height: screenHeight(context) * .7,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        elevation: 5,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    //color: AppColors.settingsBackground,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    leading: bundleState.selectedBundle!.icon ==
                                            null
                                        ? SvgPicture.asset(
                                            'assets/icons/ic_default.svg')
                                        : Image.network(
                                            '$baseUrl${bundleState.selectedBundle!.icon}'),
                                    title: Text(
                                      bundleState.selectedBundle!.name,
                                      style:
                                          TextStyle(color: AppColors.textColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                color: AppColors.settingsBackground,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: bundleState
                                        .selectedBundle!.services!.length,
                                    itemBuilder: (context, index) {
                                      return Column(children: [
                                        if (index == 0)
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ListTile(
                                          title: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                                '${bundleState.selectedBundle!.services![index].name}  '),
                                          ),
                                          leading: bundleState
                                                          .selectedBundle!
                                                          .services![index]
                                                          .icon ==
                                                      null ||
                                                  bundleState
                                                      .selectedBundle!
                                                      .services![index]
                                                      .icon!
                                                      .isEmpty
                                              ? SvgPicture.asset(
                                                  'assets/icons/ic_default.svg')
                                              : Image.network(
                                                  '$baseUrl${bundleState.selectedBundle!.services![index].icon}',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Divider(
                                              thickness: 1.5,
                                            ),
                                          ),
                                        ),
                                      ]);
                                    }),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: Container(
                                  color:
                                      AppColors.anotherPurple.withOpacity(.20),
                                  child: Center(
                                    child: Text(
                                      'addToCard'.tr(),
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    barrierColor: AppColors.bottomSheetBarrier,
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => AddToCardBottomSheet(
                                      icon: bundleState.selectedBundle!.icon,
                                      serviceName:
                                          '${bundleState.selectedBundle!.name}  ',
                                      price: bundleState.selectedBundle!.price!,
                                      id: widget.bundleId,
                                      isBundle: true,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 30,
                    child: ShoppingCart(
                      color: AppColors.white,
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
