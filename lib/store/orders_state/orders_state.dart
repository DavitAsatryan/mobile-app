import 'package:cursus_app/data/repository/order_repository.dart';
import 'package:cursus_app/model/order/order_details_model.dart';
import 'package:cursus_app/model/order/order_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/pages/main_navigation/orders_page.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'orders_state.g.dart';

class OrdersState = _OrdersState with _$OrdersState;

abstract class _OrdersState with Store {
  final OrderRepository orderRepository = OrderRepository();
  final StoreState storeState= StoreState();

  _OrdersState() {
    ordersController.addPageRequestListener((_) {
      getOrders();
    });
  }

  static const fetchLimit = 20;

  PagingController<int, OrderModel> ordersController =
      PagingController<int, OrderModel>(firstPageKey: 0);

  @observable
  OrderType selectedOrderType = OrderType.active;


  @observable
  OrderDetailsModel? orderDetailsModel;

  int currentOffset = 0;

  @action
  void setOrderType(OrderType orderType) {
    selectedOrderType = orderType;
    currentOffset = 0;
    ordersController.itemList = [];
    getOrders();
  }

  @action
  void cancelOrderID(int orderID) {
    storeState.changeState(StoreStates.loading);
    orderRepository.cancelOrder(orderID);
    storeState.changeState(StoreStates.success);
  }

  @action
  Future<void> getOrders() async {
    try {
      storeState.changeState(StoreStates.loading);
      List<OrderModel> orders = await orderRepository.getOrdersByType(
        orderType: selectedOrderType,
        offset: currentOffset,
        limit: fetchLimit,
      );
      final isLastPage = orders.length < fetchLimit;
      if (isLastPage) {
        ordersController.appendLastPage(orders);
      } else {
        currentOffset += orders.length;
        ordersController.appendPage(orders, currentOffset);
      }
      if (orders.isEmpty && currentOffset == 0) {
        storeState.changeState(StoreStates.empty);
      } else {
        storeState.changeState(StoreStates.success);
      }
    } on Exception catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> getOrderById(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      orderDetailsModel = await orderRepository.getOrdersDetails(id);
      storeState.changeState(StoreStates.success);
    } on Exception catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

}
