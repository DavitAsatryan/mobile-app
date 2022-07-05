import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/bundle/bundle_state.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/add_to_card_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/search_box.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/shopping_cart.dart';
import 'package:cursus_app/ui/widgets/service_overlay.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../router.gr.dart';
import '../../../store/dashboard/dashboard_state.dart';
import '../../../values/values.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final dashboardState = GetIt.I<DashboardState>();
  final bundleState = GetIt.I<BundleState>();
  final serviceState = GetIt.I<ServiceState>();
  TabController? tabController;
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    bundleState.getBundles();
    serviceState.getRootCategoryList();
    serviceState.setSearchText('');
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SingleChildScrollView(
        child: bundleState.storeState.state == StoreStates.loading
            ? const Loading(
                color: Colors.transparent,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'hello'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: AppColors.textPurpleColor,
                                  fontSize: 20),
                        ),
                        ShoppingCart(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'whatDoYouNeed'.tr(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchBox(
                      borderColor: AppColors.dividerColor.withOpacity(.5),
                      onChanged: (text) {
                        serviceState.setSearchText(text);
                        serviceState.searchController.refresh();
                        serviceState.search();
                      },
                      hintText: 'lookingFor'.tr(),
                      borderRadius: serviceState.shouldSearchOverlayBeVisible
                          ? const BorderRadius.only(
                              topRight: Radius.circular(6),
                              topLeft: Radius.circular(6),
                            )
                          : BorderRadius.circular(6),
                      fontColor: AppColors.black400,
                      fillColor: serviceState.shouldSearchOverlayBeVisible
                          ? AppColors.white
                          : AppColors.white.withOpacity(.25),
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.black400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ServiceOverlay(serviceState: serviceState),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (listContext, index) {
                        return InkWell(
                          onTap: () async {
                            await AutoRouter.of(context).push(SubCategoryRoute(
                                categoryId:
                                    serviceState.rootCategoryList[index].id));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Container(
                                  width: 170,
                                  height: 120,
                                  child: SvgPicture.asset(
                                    'assets/illustrations/ill_menu_item_background.svg',
                                    color: serviceState.rootCategoryList[index]
                                                .color !=
                                            null
                                        ? Color(0xFF +
                                            int.parse(serviceState
                                                .rootCategoryList[index]
                                                .color!))
                                        : serviceState
                                            .categoryBackgroundColorList[index],
                                  ),
                                ),
                                Positioned(
                                  bottom: 50,
                                  left: 25,
                                  right: 25,
                                  top: 10,
                                  child: serviceState
                                              .rootCategoryList[index].icon ==
                                          null
                                      ? SvgPicture.asset(
                                          'assets/icons/ic_default.svg',
                                        )
                                      : Image.network(
                                          '$baseUrl${serviceState.rootCategoryList[index].icon}'),
                                ),
                                Positioned(
                                  top: 105,
                                  bottom: 0,
                                  right: -5,
                                  left: -5,
                                  child: Text(
                                    serviceState.rootCategoryList[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // Positioned(
                                //   top: 100,
                                //   bottom: 0,
                                //   right: 0,
                                //   left: 0,
                                //   child: Text(
                                //     serviceState.rootCategoryList[index].name,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .headline2!
                                //         .copyWith(fontSize: 16),
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: serviceState.rootCategoryList.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                            controller: controller,
                            itemCount: bundleState.bundleList.length,
                            itemBuilder: (listContext, index) {
                              return GestureDetector(
                                onTap: () => showModalBottomSheet(
                                  barrierColor: AppColors.bottomSheetBarrier,
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => AddToCardBottomSheet(
                                    icon: bundleState.bundleList[index].icon,
                                    serviceName:
                                        '${bundleState.bundleList[index].name}  ',
                                    price: bundleState.bundleList[index].price!,
                                    id: bundleState.bundleList[index].id,
                                    isBundle: true,
                                  ),
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                            colors: [
                                              AppColors.purpleDark,
                                              AppColors.purpleLight,
                                            ],
                                            begin: FractionalOffset(1, 1),
                                            end: FractionalOffset(1, 0),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          child: Image.asset(
                                            'assets/icons/ill_dust.png',
                                            scale: 2,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: SvgPicture.asset(
                                          'assets/icons/nerves_dust.svg',
                                          // fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: -5,
                                          top: 6,
                                          child: Image.asset(
                                            'assets/images/person.png',
                                            fit: BoxFit.cover,
                                          )),
                                      Positioned(
                                        left: 12,
                                        top: 12,
                                        right: 120,
                                        bottom: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bundleState
                                                  .bundleList[index].name,
                                              style: Styles.semiBoldTextStyle
                                                  .copyWith(
                                                      fontSize: 18,
                                                      color: AppColors.white),
                                            ),
                                            Text(
                                              bundleState.bundleList[index]
                                                  .description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              style: Styles.mainTextStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: AppColors.white),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Spacer(),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                text: 'price'.tr() + ' ',
                                              ),
                                              TextSpan(
                                                  text:
                                                      '${formatCurrency.format(bundleState.bundleList[index].price)}  \֏',
                                                  style: Styles.boldTextStyle
                                                      .copyWith(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 14)),
                                            ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 16),
                      SmoothPageIndicator(
                        controller: controller,
                        count: bundleState.bundleList.isNotEmpty
                            ? bundleState.bundleList.length
                            : 1,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: AppColors.purpleDots.withOpacity(.85),
                          dotColor: AppColors.purpleDots.withOpacity(.25),
                          expansionFactor: 4,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(const BundlesRoute());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'viewAllBundles'.tr(),
                          style: TextStyle(
                              color: AppColors.anotherPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
      );
    });
  }
}
