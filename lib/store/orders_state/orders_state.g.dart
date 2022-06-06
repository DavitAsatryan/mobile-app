// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersState on _OrdersState, Store {
  final _$selectedOrderTypeAtom = Atom(name: '_OrdersState.selectedOrderType');

  @override
  OrderType get selectedOrderType {
    _$selectedOrderTypeAtom.reportRead();
    return super.selectedOrderType;
  }

  @override
  set selectedOrderType(OrderType value) {
    _$selectedOrderTypeAtom.reportWrite(value, super.selectedOrderType, () {
      super.selectedOrderType = value;
    });
  }

  final _$orderDetailsModelAtom = Atom(name: '_OrdersState.orderDetailsModel');

  @override
  OrderDetailsModel? get orderDetailsModel {
    _$orderDetailsModelAtom.reportRead();
    return super.orderDetailsModel;
  }

  @override
  set orderDetailsModel(OrderDetailsModel? value) {
    _$orderDetailsModelAtom.reportWrite(value, super.orderDetailsModel, () {
      super.orderDetailsModel = value;
    });
  }

  final _$getOrdersAsyncAction = AsyncAction('_OrdersState.getOrders');

  @override
  Future<void> getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  final _$getOrderByIdAsyncAction = AsyncAction('_OrdersState.getOrderById');

  @override
  Future<void> getOrderById(int id) {
    return _$getOrderByIdAsyncAction.run(() => super.getOrderById(id));
  }

  final _$_OrdersStateActionController = ActionController(name: '_OrdersState');

  @override
  void setOrderType(OrderType orderType) {
    final _$actionInfo = _$_OrdersStateActionController.startAction(
        name: '_OrdersState.setOrderType');
    try {
      return super.setOrderType(orderType);
    } finally {
      _$_OrdersStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelOrderID(int orderID) {
    final _$actionInfo = _$_OrdersStateActionController.startAction(
        name: '_OrdersState.cancelOrderID');
    try {
      return super.cancelOrderID(orderID);
    } finally {
      _$_OrdersStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedOrderType: ${selectedOrderType},
orderDetailsModel: ${orderDetailsModel}
    ''';
  }
}
