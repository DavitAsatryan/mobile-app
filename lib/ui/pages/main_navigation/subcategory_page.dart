import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/shopping_cart.dart';
import 'package:cursus_app/ui/widgets/category_search_overlay.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/name_label.dart';
import 'package:cursus_app/ui/widgets/search_box.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class SubCategoryPage extends StatefulWidget {
  final int categoryId;

  const SubCategoryPage({required this.categoryId, Key? key}) : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  final serviceState = GetIt.I<ServiceState>();

  @override
  void initState() {
    super.initState();
    manageNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Observer(
        builder: (_) => serviceState.storeState.state == StoreStates.loading
            ? Loading(
                color: Colors.transparent,
              )
            : Stack(
                children: [
                  Positioned(
                    left: 15,
                    right: 15,
                    top: 20,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                          ),
                          Observer(
                            builder: (_) => NameLabel(
                              label: serviceState.selectedCategory!.name,
                            ),
                          ),
                          SearchBox(
                            borderColor: AppColors.dividerColor.withOpacity(.5),
                            onChanged: (text) {
                              serviceState.setCategorySearchText(text);
                              serviceState.categorySearchController.refresh();
                              serviceState.searchInCategories(
                                  id: serviceState.selectedCategory!.id);
                            },
                            hintText: 'searchCategories'.tr(),
                            borderRadius: serviceState
                                    .shouldCategorySearchOverlayBeVisible
                                ? const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                  )
                                : BorderRadius.circular(6),
                            fontColor: AppColors.black400,
                            fillColor: serviceState
                                    .shouldCategorySearchOverlayBeVisible
                                ? AppColors.white
                                : AppColors.white.withOpacity(.25),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.black400,
                            ),
                          ),
                          SearchOverlay(
                            isRoot: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              serviceState.selectedCategory!.description!,
                              style: TextStyle(
                                  color: AppColors.greyTextColorOps85),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Observer(
                            builder: (_) => ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (listContext, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      AutoRouter.of(context).push(
                                          LaboratoryRoute(
                                              subCategoryId: serviceState
                                                  .selectedCategory!
                                                  .categories![index]
                                                  .id));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 30),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: serviceState
                                                        .backgroundGradientList[
                                                    index]),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    serviceState
                                                        .selectedCategory!
                                                        .categories![index]
                                                        .name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: -10,
                                            top: 0,
                                            child: Image.asset(
                                              'assets/images/category_card_background.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: -20,
                                            child: RotationTransition(
                                              turns: AlwaysStoppedAnimation(
                                                  15 / 360),
                                              child: serviceState
                                                          .selectedCategory!
                                                          .categories![index]
                                                          .icon ==
                                                      null
                                                  ? SvgPicture.asset(
                                                      'assets/icons/ic_default.svg',
                                                      height: 65,
                                                    )
                                                  : Image.network(
                                                      '$baseUrl${serviceState.selectedCategory!.categories![index].icon}',
                                                      height: 65,
                                                    ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount:
                                    serviceState.selectedCategory!.categories ==
                                            null
                                        ? 0
                                        : serviceState.selectedCategory!
                                            .categories!.length),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: ShoppingCart(),
                  ),
                ],
              ),
      )),
    );
  }

  Future<void> manageNavigation() async {
    await serviceState.getCategoryById(widget.categoryId, false);
  }
}
