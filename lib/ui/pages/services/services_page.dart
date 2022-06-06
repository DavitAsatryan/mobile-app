import 'package:cursus_app/data/dio.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/category/category_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/shopping_cart.dart';
import 'package:cursus_app/ui/widgets/background_gradient.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/add_to_card_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/service_overlay.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../values/values.dart';
import '../../widgets/search_box.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final serviceState = GetIt.I<ServiceState>();

  @override
  void initState() {
    super.initState();
    serviceState.getCategoriesWithServices();
    serviceState.setSearchText('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              appBar: CustomAppBar(
                callback: () {
                  serviceState.setSearchText('');
                },
                title: 'keywords.services'.tr(),
                titleSize: 25,
                textAndIconColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 25),
              ),
              body: Observer(
                builder: (_) => Stack(
                  children: [
                    Positioned(
                      right: -50,
                      bottom: 0,
                      width: MediaQuery.of(context).size.height / 2.5,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: SvgPicture.asset(
                        'assets/icons/ic_services.svg',
                        color: AppColors.black.withOpacity(.1),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          if (serviceState.storeState.state ==
                              StoreStates.success)
                            Expanded(
                              child: PagedListView<int, CategoryModel>(
                                pagingController:
                                    serviceState.servicesController,
                                builderDelegate:
                                    PagedChildBuilderDelegate<CategoryModel>(
                                  itemBuilder: (context, item, index) =>
                                      _CategoryWithServices(
                                    categoryModel: item,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: SearchBox(
                                borderColor: Colors.transparent,
                                onChanged: (text) {
                                  serviceState.setSearchText(text);
                                  serviceState.searchController.refresh();
                                  serviceState.search();
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
                                fillColor:
                                    serviceState.shouldSearchOverlayBeVisible
                                        ? AppColors.white
                                        : AppColors.white.withOpacity(.25),
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black400,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: ServiceOverlay(serviceState: serviceState),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (serviceState.storeState.state == StoreStates.loading)
                      Loading(color: Colors.transparent),
                  ],
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
        ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.categoryModel.name,
            style: Styles.boldTextStyle.copyWith(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categoryModel.categories!.length,
              itemBuilder: (context, index) => _SubCategoryContainer(
                onPressed: () {
                  if (index == opendCategoryIndex) {
                    opendCategoryIndex = -1;
                  } else {
                    opendCategoryIndex = index;
                  }
                  setState(() {});
                },
                categoryModel: widget.categoryModel.categories![index],
                isOpen: opendCategoryIndex == index,
                color: opendCategoryIndex != index
                    ? AppColors.white.withOpacity(.6)
                    : AppColors.white,
              ),
            ),
          ),
          if (opendCategoryIndex != -1)
            _ServicesOverlay(
              services: widget
                  .categoryModel.categories![opendCategoryIndex].services!,
            ),
        ],
      ),
    );
  }
}

class _SubCategoryContainer extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isOpen;
  final VoidCallback onPressed;
  final Color color;

  const _SubCategoryContainer({
    required this.categoryModel,
    required this.isOpen,
    required this.onPressed,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 22,
                        height: 20,
                        child: categoryModel.icon == null
                            ? SvgPicture.asset('assets/icons/ic_default.svg')
                            : Image.network('$baseUrl${categoryModel.icon}'),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        categoryModel.name,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ServicesOverlay extends StatelessWidget {
  final List<ServiceModel> services;

  const _ServicesOverlay({
    required this.services,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) => _ServiceTile(
              serviceModel: services[index],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final ServiceModel serviceModel;

  const _ServiceTile({
    required this.serviceModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            barrierColor: AppColors.bottomSheetBarrier,
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddToCardBottomSheet(
              serviceName: '${serviceModel.name}  ',
              price: serviceModel.price!,
              id: serviceModel.id,
              icon: serviceModel.icon,
              isBundle: false,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      serviceModel.name,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${serviceModel.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (serviceModel.description != null &&
                      serviceModel.description!.isNotEmpty)
                    Tooltip(
                      message: serviceModel.description!,
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.textPurpleColor,
                      ),
                    ),
                  Icon(
                    Icons.add,
                  )
                ],
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.primaryText1.withOpacity(.5),
              )
            ],
          ),
        ));
  }
}

class _SearchOverlay extends StatelessWidget {
  final ServiceState serviceState;

  const _SearchOverlay({
    required this.serviceState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Visibility(
        visible: serviceState.shouldSearchOverlayBeVisible,
        child: Container(
          height: screenHeight(context) / 3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(.8),
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
    if (serviceState.searchState.state == StoreStates.success) {
      return PagedListView<int, ServiceModel>(
        pagingController: serviceState.searchController,
        builderDelegate: PagedChildBuilderDelegate<ServiceModel>(
          itemBuilder: (context, item, index) => _ServiceTile(
            serviceModel: item,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.empty) {
      return Center(
        child: Text(
          'No Services Found',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.error) {
      return Center(
        child: Text(
          'Something went wrong!!',
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
