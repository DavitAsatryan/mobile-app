import 'package:cursus_app/model/order/order_service_model.dart';
import 'package:cursus_app/ui/widgets/appbar_icons/close_icon.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'order_details.dart';

class OrderServiceDetailsPage extends StatelessWidget {
  final OrderServiceModel orderServiceModel;
  final String currency;

  const OrderServiceDetailsPage({
    required this.orderServiceModel,
    required this.currency,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        toolBarHeight: 50,
        title: orderServiceModel.service!.name,
        trailingIcon: CloseIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID ${orderServiceModel.id}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    orderServiceModel.status,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.purpleDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
              DetailRow(
                item: 'Service Name',
                detail: orderServiceModel.service!.name,
                itemColor: AppColors.greyTextColorOps85,
              ),
              DetailRow(
                item: 'price'.tr(),
                detail: '${orderServiceModel.service!.price} $currency',
                itemColor: AppColors.greyTextColorOps85,
              ),
              DetailRow(
                item: 'agents_name'.tr(),
                detail: orderServiceModel.service!.createdByName!,
                itemColor: AppColors.greyTextColorOps85,
              ),
              Divider(
                height: 30,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'notes'.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.greyTextColorOps85,
                  ),
                ),
              ),
              Text(
                orderServiceModel.notes ?? 'N/A',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Diagnosis',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.greyTextColorOps85,
                  ),
                ),
              ),
              Text(
                orderServiceModel.diagnosis ?? 'N/A',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Attachment(s)',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.greyTextColorOps85,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
