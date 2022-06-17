import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/model/order/order_details_model.dart';
import 'package:cursus_app/model/order/order_service_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/orders_state/orders_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/dilemma_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/buttons/outlined_main_button.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderDetailsPage extends StatefulWidget {
  final int oderID;

  const OrderDetailsPage({
    required this.oderID,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  OrdersState ordersState = OrdersState();

  @override
  void initState() {
    super.initState();
    ordersState.getOrderById(widget.oderID);
  }

  var dateFormat = DateFormat('dd MMMM yy');

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Stack(
        children: [
          Image.asset(
            'assets/illustrations/ill_back.png',
          ),
          Scaffold(
            appBar: CustomAppBar(
              toolBarHeight: 50,
            ),
            body: ordersState.storeState.state == StoreStates.loading ||
                    ordersState.storeState.state == StoreStates.initial
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _OrderStatus(
                            orderId:
                                ordersState.orderDetailsModel!.id.toString(),
                            status: ordersState.orderDetailsModel!.status,
                          ),
                          DetailRow(
                            item: 'orders_date'.tr(),
                            detail:
                                '${dateFormat.format(ordersState.orderDetailsModel!.createdAt)}, ${DateFormat.Hm().format(ordersState.orderDetailsModel!.createdAt)}',
                          ),
                          DetailRow(
                            item: 'appointment'.tr(),
                            detail:
                                '${dateFormat.format(ordersState.orderDetailsModel!.createdAt)}, ${DateFormat.Hm().format(ordersState.orderDetailsModel!.appointmentDate)}',
                          ),
                          _SectionDivider(
                            sectionName: 'patient'.tr(),
                          ),
                          _PatientDetails(
                            orderDetailsModel: ordersState.orderDetailsModel!,
                          ),
                          _SectionDivider(
                            sectionName: 'address'.tr(),
                          ),
                          Text(
                            ordersState.orderDetailsModel!.address,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          DetailRow(
                            item: 'entrance'.tr(),
                            detail: ordersState.orderDetailsModel!.entrance ==
                                        null ||
                                    ordersState
                                        .orderDetailsModel!.entrance!.isEmpty
                                ? 'N/A'
                                : ordersState.orderDetailsModel!.entrance!,
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'entrance_code'.tr(),
                            detail: ordersState
                                            .orderDetailsModel!.entranceCode ==
                                        null ||
                                    ordersState.orderDetailsModel!.entranceCode!
                                        .isEmpty
                                ? 'N/A'
                                : ordersState.orderDetailsModel!.entranceCode!,
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'floor'.tr(),
                            detail:
                                ordersState.orderDetailsModel!.floor == null ||
                                        ordersState
                                            .orderDetailsModel!.floor!.isEmpty
                                    ? 'N/A'
                                    : ordersState.orderDetailsModel!.floor!,
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          _SectionDivider(sectionName: 'payment'.tr()),
                          DetailRow(
                            item: 'payment_method'.tr(),
                            detail:
                                ordersState.orderDetailsModel!.payment.method,
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'payment_status'.tr(),
                            detail:
                                ordersState.orderDetailsModel!.payment.status,
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'price'.tr(),
                            detail:
                                '${ordersState.orderDetailsModel!.payment.orderPrice} \֏',
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'transaction_fee'.tr(),
                            detail:
                                '${ordersState.orderDetailsModel!.payment.transportationPrice} \֏',
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          DetailRow(
                            item: 'total'.tr(),
                            detail:
                                '${ordersState.orderDetailsModel!.payment.totalPrice} \֏',
                          ),
                          _SectionDivider(sectionName: 'service'.tr()),
                          DetailRow(
                            item: 'ID',
                            detail: ordersState.orderDetailsModel!.payment.id
                                .toString(),
                            itemColor: AppColors.greyTextColorOps85,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                ordersState.orderDetailsModel!.services.length,
                            itemBuilder: (context, index) => _ServiceRow(
                              orderServiceModel: ordersState
                                  .orderDetailsModel!.services[index],
                              currency: ordersState
                                  .orderDetailsModel!.payment.currency,
                            ),
                          ),
                          DetailRow(
                            item: 'status'.tr(),
                            detail: '${ordersState.orderDetailsModel!.status}',
                            isItemBold: true,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          OutlinedMainButton(
                            callback: () {
                              showModalBottomSheet(
                                barrierColor: AppColors.bottomSheetBarrier,
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => DilemmaBottomSheet(
                                    question: 'cancelOrder'.tr(),
                                    positiveAnswer: 'keywords.yupCancel'.tr(),
                                    negativeAnswer: 'keywords.dontCancel'.tr(),
                                    positiveAnswerCallback: () async {
                                      ordersState.cancelOrderID(
                                          ordersState.orderDetailsModel!.id);
                                    }),
                              );
                            },
                            label: 'keywords.cancel_order'.tr(),
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ),
          ),

          //   if (ordersState.storeState.state == StoreStates.loading) const Loading()
        ],
      ),
    );
  }
}

class _PatientDetails extends StatelessWidget {
  final OrderDetailsModel orderDetailsModel;

  const _PatientDetails({
    required this.orderDetailsModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.network(
              orderDetailsModel.user.profilePicture != null
                  ? 'https://api.cursus.am/${orderDetailsModel.user.profilePicture}'
                  : 'https://api.cursus.am/profile_icon.png',
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderDetailsModel.user.firstName,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    orderDetailsModel.user.lastName,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    orderDetailsModel.user.birthDate != null
                        ? orderDetailsModel.user.gender == null ? 'notSpecified'.tr() : '${orderDetailsModel.user.gender}, ${_calcAge(orderDetailsModel.user.birthDate!)}'
                        : '${orderDetailsModel.user.gender}',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'hints.phoneNumber'.tr() + '${orderDetailsModel.user.phone}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String item;
  final String detail;
  final bool isItemBold;
  final Color? itemColor;

  const DetailRow({
    required this.item,
    required this.detail,
    this.isItemBold = false,
    this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: TextStyle(
              fontSize: 17,
              color: itemColor ?? Colors.black,
              fontWeight: isItemBold ? FontWeight.bold : null,
            ),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  final String sectionName;

  const _SectionDivider({
    required this.sectionName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionName,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.black54,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _OrderStatus extends StatelessWidget {
  final String orderId;
  final String status;

  const _OrderStatus({
    required this.orderId,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order ID $orderId',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              status,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.purpleDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final OrderServiceModel orderServiceModel;
  final String currency;

  const _ServiceRow({
    required this.orderServiceModel,
    required this.currency,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(OrderServiceDetailsRoute(
              orderServiceModel: orderServiceModel, currency: currency));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'service_name'.tr(),
              style: TextStyle(
                fontSize: 17,
                color: AppColors.greyTextColorOps85,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  orderServiceModel.service != null
                      ? '${orderServiceModel.service!.name}'
                      : " N/A",
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPurpleColor,
                  ),
                ),
                if (orderServiceModel.service != null)
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Price  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyTextColorOps85,
                      ),
                    ),
                    TextSpan(
                      text:
                          orderServiceModel.service!.price!.toString() + ' \֏',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ])),

                // Text(
                //   'Price ${orderServiceModel.service.price} AMD',
                //   maxLines: 1,
                //   textAlign: TextAlign.end,
                //   overflow: TextOverflow.ellipsis,
                //   style: const TextStyle(
                //     fontSize: 17,
                //     fontWeight: FontWeight.w700,
                //     //color: AppColors.purpleDark,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int _calcAge(DateTime brirthDate) {
  return DateTime.now().difference(brirthDate).inDays ~/ 365;
}
