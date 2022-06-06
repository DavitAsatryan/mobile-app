import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/model/category/category_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/bundle/bundle_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/background_gradient.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/add_to_card_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/item_bundle_search.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../values/values.dart';
import '../../widgets/search_box.dart';

class BundlesPage extends StatefulWidget {
  const BundlesPage({Key? key}) : super(key: key);

  @override
  _BundlesPageState createState() => _BundlesPageState();
}

class _BundlesPageState extends State<BundlesPage> {
  BundleState bundleState = GetIt.I<BundleState>();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'keywords.bundles'.tr(),
          titleSize: 25,
          textAndIconColor: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 25),
        ),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Observer(
          builder: (_) => bundleState.storeState.state == StoreStates.loading
              ? Loading(
                  color: Colors.transparent,
                )
              : Stack(
                  children: [
                    Positioned(
                      right: -50,
                      bottom: 0,
                      width: MediaQuery.of(context).size.height / 2.5,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: SvgPicture.asset(
                        'assets/icons/ic_bundle.svg',
                        color: AppColors.black.withOpacity(.1),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        right: 0,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'chooseBundle'.tr(),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: <Widget>[
                                for (int i = 0;
                                    i < bundleState.bundleList.length;
                                    i++)
                                  buildChip(
                                      bundleState.bundleList[i].name,
                                      bundleState.bundleList[i].icon,
                                      bundleState.bundleList[i].id)
                              ],
                            )
                          ],
                        )),
                    Positioned(
                      top: 0,
                      right: 20,
                      left: 20,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SearchBox(
                            borderColor: Colors.transparent,
                            onChanged: (text) {
                              bundleState.setSearchText(text);
                              bundleState.searcgController.refresh();
                              bundleState.search();
                            },
                            hintText: 'search_bundles'.tr(),
                            borderRadius:
                                bundleState.shouldSearchOverlayBeVisible
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(6),
                                        topLeft: Radius.circular(6),
                                      )
                                    : BorderRadius.circular(6),
                            fontColor: AppColors.black400,
                            fillColor: bundleState.shouldSearchOverlayBeVisible
                                ? AppColors.white
                                : AppColors.white.withOpacity(.25),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.black400,
                            ),
                          ),
                          _SearchOverlay(bundleState: bundleState),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> getInfo() async {
    await bundleState.getBundles();
  }

  Widget buildChip(String label, String? icon, int id) {
    return GestureDetector(
      onTap: () =>
          AutoRouter.of(context).push(BundleDetailsRoute(bundleId: id)),
      child: Chip(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        avatar: CircleAvatar(
          backgroundColor: Colors.white70,
          child: icon == null || icon.isEmpty
              ? SvgPicture.asset('assets/icons/ic_default.svg')
              : Image.network('$baseUrl$icon'),
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textColor,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}

class _CategoryWithServices extends StatefulWidget {
  final CategoryModel categoryModel;

  const _CategoryWithServices({
    required this.categoryModel,
    Key? key,
  }) : super(key: key);

  @override
  State<_CategoryWithServices> createState() => _CategoryWithServicesState();
}

class _CategoryWithServicesState extends State<_CategoryWithServices> {
  int opendCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    );
  }
}

// class _BundleContainer extends StatelessWidget {
//   final BundleModel bundleModel;
//   final bool isOpen;
//   final VoidCallback onPressed;
//
//   const _BundleContainer({
//     required this.bundleModel,
//     required this.isOpen,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: InkWell(
//             onTap: onPressed,
//             child: Container(
//               height: 42,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 22,
//                         height: 20,
//                         child: SvgPicture.asset(
//                           'assets/icons/ic_diagnostics.svg',
//                         ),
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         bundleModel.name,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _BundleSearchOverlay extends StatelessWidget {
//   final List<BundleModel> filteredBundleList;
//
//   const _BundleSearchOverlay({
//     required this.filteredBundleList,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12),
//       child: Container(
//         width: double.infinity,
//         height: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: AppColors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: ListView.builder(
//             itemCount: filteredBundleList.length,
//             itemBuilder: (context, index) => ItemBundleSearch(
//               bundleModel: filteredBundleList[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _SearchOverlay extends StatelessWidget {
  final BundleState bundleState;

  const _SearchOverlay({
    required this.bundleState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Visibility(
        visible: bundleState.shouldSearchOverlayBeVisible,
        child: Container(
          height: screenHeight(context) / 3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Observer(
            builder: (_) => _buildUi(),
          ),
        ),
      ),
    );
  }

  Widget _buildUi() {
    if (bundleState.searchState.state == StoreStates.success) {
      return PagedListView<int, BundleModel>(
        pagingController: bundleState.searcgController,
        builderDelegate: PagedChildBuilderDelegate<BundleModel>(
          itemBuilder: (context, item, index) => GestureDetector(
            onTap: () => showModalBottomSheet(
              barrierColor: AppColors.bottomSheetBarrier,
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => AddToCardBottomSheet(
                icon: bundleState.bundleList[index].icon,
                serviceName: '${bundleState.bundleList[index].name}  ',
                price: bundleState.bundleList[index].price!,
                id: bundleState.bundleList[index].id,
                isBundle: true,
              ),
            ),
            child: ItemBundleSearch(
              bundleModel: item,
            ),
          ),
        ),
      );
    } else if (bundleState.searchState.state == StoreStates.empty) {
      return Center(
        child: Text(
          'noBundlesFound'.tr(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else if (bundleState.searchState.state == StoreStates.error) {
      return Center(
        child: Text(
          'somethingWentWrong'.tr(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.purpleLight,
        ),
      );
    }
  }
}
