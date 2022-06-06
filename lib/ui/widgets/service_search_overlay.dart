import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'bottom_sheet_dialog/add_to_card_bottom_sheet.dart';

class ServiceSearchOverlay extends StatefulWidget {
  const ServiceSearchOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceSearchOverlay> createState() => _ServiceSearchOverlayState();
}

class _ServiceSearchOverlayState extends State<ServiceSearchOverlay> {
  final serviceState = GetIt.I<ServiceState>();

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
            border: Border.all(
              width: 1,
              color: AppColors.purpleDots,
            ),
            color: AppColors.purpleDots.withOpacity(.1),
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

class _ServiceTile extends StatefulWidget {
  final ServiceModel serviceModel;

  const _ServiceTile({
    required this.serviceModel,
    Key? key,
  }) : super(key: key);

  @override
  State<_ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<_ServiceTile> {
  final serviceState = GetIt.I<ServiceState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          serviceState.setCategorySearchText('');

          showModalBottomSheet(
            barrierColor: AppColors.bottomSheetBarrier,
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddToCardBottomSheet(
              icon: widget.serviceModel.icon,
              serviceName: widget.serviceModel.name,
              price: widget.serviceModel.price!,
              id: widget.serviceModel.id,
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
                      widget.serviceModel.name,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${widget.serviceModel.price} \֏',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor),
                  ),
                  SizedBox(
                    width: 5,
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
