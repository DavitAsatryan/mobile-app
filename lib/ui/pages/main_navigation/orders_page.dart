import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/model/order/order_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/orders_state/orders_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:nil/nil.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  OrdersState ordersState = OrdersState();

  @override
  void initState() {
    super.initState();
    ordersState.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 20,
              left: 20,
              child: Text(
                'orders'.tr(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              )),
          Positioned(
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/illustrations/ill_back.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 70),
            child: Observer(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrdersTabBar(
                    ordersState: ordersState,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildUi(ordersState.storeState.state),
                      ],
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

  Widget _buildUi(StoreStates state) {
    if (state == StoreStates.loading || state == StoreStates.initial) {
      return const CircularProgressIndicator(
        color: AppColors.purpleDark,
      );
    } else if (state == StoreStates.success) {
      return Expanded(
        child: PagedListView<int, OrderModel>(
          pagingController: ordersState.ordersController,
          builderDelegate: PagedChildBuilderDelegate<OrderModel>(
            itemBuilder: (context, item, index) => OrderCard(
              orderModel: item,
              isLastItemInTheList:
                  index == ordersState.ordersController.itemList!.length - 1,
            ),
          ),
        ),
      );
    } else if (state == StoreStates.empty) {
      return Text(
        'noOrders'.tr(),
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Text('dataFetchingProblem'.tr());
    }
  }
}

class OrderCard extends StatefulWidget {
  final OrderModel orderModel;
  final bool isLastItemInTheList;

  const OrderCard({
    required this.orderModel,
    required this.isLastItemInTheList,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  var outputFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              AutoRouter.of(context)
                  .push(OrderDetailsRoute(oderID: widget.orderModel.id));
            },
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.grey250,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 85,
                                  child: Center(
                                    child: Text(
                                      '${widget.orderModel.id}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 85,
                                  child: Center(
                                    child: Text(
                                      outputFormat
                                          .format(widget.orderModel.date),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greyTextColorOps85,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, left: 2),
                                child: Text(
                                  widget.orderModel.patientName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    height: 1.6,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${widget.orderModel.amount.total}  \֏',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  correspondingIcon(widget.orderModel.status),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.isLastItemInTheList,
          child: SizedBox(
            height: 100,
          ),
        ),
      ],
    );
  }

  Widget correspondingIcon(String status) {
    switch (status) {
      case 'pending':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_status_pending.svg',
              ),
              SizedBox(
                width: 90,
                child: Center(
                  child: Text(
                    'pending'.tr(),
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.purpleDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'in_progress':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_status_progress.svg',
            ),
            SizedBox(
              width: 90,
              child: Center(
                child: Text(
                  'in_progress'.tr(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.purpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      case 'completed':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_status_completed.svg',
            ),
            SizedBox(
              width: 90,
              child: Center(
                child: Text(
                  'completed'.tr(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.purpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      case 'cancelled':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/ic_status_canceled.svg'),
            SizedBox(
              width: 90,
              child: Center(
                child: Text(
                  'cancelled'.tr(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.purpleDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      default:
        return nil;
    }
  }
}

class OrdersTabBar extends StatelessWidget {
  final OrdersState ordersState;

  const OrdersTabBar({required this.ordersState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                ordersState.setOrderType(OrderType.active);
              },
              child: _TabBarContainer(
                name: 'keywords.active'.tr(),
                isSelected: OrderType.active == ordersState.selectedOrderType,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                ordersState.setOrderType(OrderType.completed);
              },
              child: _TabBarContainer(
                name: 'keywords.completed'.tr(),
                isSelected:
                    OrderType.completed == ordersState.selectedOrderType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarContainer extends StatelessWidget {
  final String name;
  final bool isSelected;

  const _TabBarContainer({
    required this.name,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.purpleDark : Colors.white,
        border: Border.all(
          width: 2,
          color: isSelected ? AppColors.purpleDark : AppColors.textPurpleColor,
        ),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : AppColors.textPurpleColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

enum OrderType { active, completed }
