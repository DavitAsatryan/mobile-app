import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'item_service_search.dart';

class ServiceOverlay extends StatelessWidget {
  final ServiceState serviceState;

  const ServiceOverlay({
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
            border: Border.all(color: AppColors.shadowColor),
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Observer(
            builder: (_) => _chooseCorrectWidget(),
          ),
        ),
      ),
    );
  }

  Widget _chooseCorrectWidget() {
    if (serviceState.searchState.state == StoreStates.success) {
      return PagedListView<int, ServiceModel>(
        pagingController: serviceState.searchController,
        builderDelegate: PagedChildBuilderDelegate<ServiceModel>(
          itemBuilder: (context, item, index) => ItemServiceSearch(
            serviceModel: item,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.empty) {
      return Center(
        child: Text(
          'emptyServiceList'.tr(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.error) {
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
