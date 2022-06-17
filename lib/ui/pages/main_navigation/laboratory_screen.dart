import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/shopping_cart.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/name_label.dart';
import 'package:cursus_app/ui/widgets/search_box.dart';
import 'package:cursus_app/ui/widgets/service_search_overlay.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../widgets/bottom_sheet_dialog/add_to_card_bottom_sheet.dart';

class LaboratoryPage extends StatefulWidget {
  final int subCategoryId;

  const LaboratoryPage({Key? key, required this.subCategoryId})
      : super(key: key);

  @override
  _LaboratoryPageState createState() => _LaboratoryPageState();
}

class _LaboratoryPageState extends State<LaboratoryPage> {
  int recursive = 1;
  final serviceState = GetIt.I<ServiceState>();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Scaffold(
            appBar: CustomAppBar(
              callback: () {
                serviceState.setSearchText('');
              },
              toolBarHeight: 50,
            ),
            body: Observer(
              builder: (_) => serviceState.storeState.state == StoreStates.loading
                  ? Loading(
                      color: Colors.transparent,
                    )
                  : SafeArea(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Image.asset(
                              'assets/illustrations/ill_back.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Positioned(
                            left: 15,
                            right: 15,
                            top: 0,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Observer(
                                  builder: (_) => NameLabel(
                                    label:
                                        serviceState.selectedSubCategoryModel!.name,
                                  ),
                                ),
                                SearchBox(
                                  borderColor: AppColors.dividerColor.withOpacity(.5),
                                  onChanged: (text) {
                                    serviceState.setSearchText(text);
                                    serviceState.searchController.refresh();
                                    serviceState.search(
                                        id: serviceState
                                            .selectedSubCategoryModel!.id);
                                  },
                                  hintText: 'search_services'.tr(),
                                  borderRadius:
                                      serviceState.shouldSearchOverlayBeVisible
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
                                ServiceSearchOverlay(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Observer(
                                  builder: (_) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      serviceState
                                          .selectedSubCategoryModel!.description!,
                                      style: TextStyle(
                                          color: AppColors.greyTextColorOps85),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Observer(
                                    builder: (_) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.offWhite200, width: 2),
                                      ),
                                      child: ListView.builder(
                                        itemBuilder: (listContext, index) {
                                          return Column(
                                            children: [
                                              ListTile(
                                                trailing: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (serviceState
                                                                .selectedSubCategoryModel!
                                                                .services![index]
                                                                .description !=
                                                            null ||
                                                        serviceState
                                                            .selectedSubCategoryModel!
                                                            .services![index]
                                                            .description!
                                                            .isNotEmpty)
                                                      Tooltip(
                                                        waitDuration: Duration(
                                                            milliseconds: 30),
                                                        message: serviceState
                                                            .selectedSubCategoryModel!
                                                            .services![index]
                                                            .description!,
                                                        child: Icon(
                                                          Icons.info_outline_rounded,
                                                          color: AppColors
                                                              .textPurpleColor,
                                                        ),
                                                      ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          showModalBottomSheet(
                                                        barrierColor: AppColors
                                                            .bottomSheetBarrier,
                                                        context: context,
                                                        isScrollControlled: true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        builder: (context) =>
                                                            AddToCardBottomSheet(
                                                          icon: serviceState
                                                              .selectedSubCategoryModel!
                                                              .services![index]
                                                              .icon,
                                                          serviceName:
                                                              '${serviceState.selectedSubCategoryModel!.services![index].name}  ',
                                                          price: serviceState
                                                              .selectedSubCategoryModel!
                                                              .services![index]
                                                              .price!,
                                                          id: serviceState
                                                              .selectedSubCategoryModel!
                                                              .services![index]
                                                              .id,
                                                          isBundle: false,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.add_rounded,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                title: RichText(
                                                  text: TextSpan(
                                                    text:
                                                        '${serviceState.selectedSubCategoryModel!.services![index].name}  ',
                                                    style: TextStyle(
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        color: AppColors.textColor),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '${serviceState.selectedSubCategoryModel!.services![index].price}  \֏',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .darkBlackColor,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: Divider(
                                                  thickness: 2,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: serviceState
                                                    .selectedSubCategoryModel!
                                                    .services ==
                                                null
                                            ? 0
                                            : serviceState.selectedSubCategoryModel!
                                                .services!.length,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
          Positioned(
            top: 60,
            right: 30,
            child: ShoppingCart(
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getInfo() async {
    await serviceState.getCategoryById(widget.subCategoryId, true);
    setState(() {});
  }
}
