import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/ui/widgets/background_gradient.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../values/values.dart';
import '../../widgets/new_order_menu_item.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
 // NewOrderState orderState = NewOrderState();

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/illustrations/ill_back.png',
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/icons/ic_tree.svg',
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              color: AppColors.grey150,
                            ),
                          ))),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'createNewOrder'.tr(),
                    style:
                        Styles.boldTextStyle.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const ServicesRoute());
                        },
                        child: NewOrderMenuItem(
                          asset: 'assets/icons/ic_services.svg',
                          menuText: 'keywords.services'.tr(),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const BundlesRoute());
                        },
                        child: NewOrderMenuItem(
                          asset: 'assets/icons/ic_bundle.svg',
                          menuText: 'keywords.bundles'.tr(),
                        ),
                      ),
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     AutoRouter.of(context).push(const PharmacyRoute());
                  //   },
                  //   child: NewOrderMenuItem(
                  //     asset: 'assets/icons/ic_pharmacy.svg',
                  //     menuText: 'keywords.pharmacy'.tr(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
