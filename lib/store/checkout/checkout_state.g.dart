// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutState on _CheckoutState, Store {
  final _$checkoutListAtom = Atom(name: '_CheckoutState.checkoutList');

  @override
  ObservableList<ShoppingCartModel> get checkoutList {
    _$checkoutListAtom.reportRead();
    return super.checkoutList;
  }

  @override
  set checkoutList(ObservableList<ShoppingCartModel> value) {
    _$checkoutListAtom.reportWrite(value, super.checkoutList, () {
      super.checkoutList = value;
    });
  }

  final _$cardsListAtom = Atom(name: '_CheckoutState.cardsList');

  @override
  ObservableList<CreditCardModel> get cardsList {
    _$cardsListAtom.reportRead();
    return super.cardsList;
  }

  @override
  set cardsList(ObservableList<CreditCardModel> value) {
    _$cardsListAtom.reportWrite(value, super.cardsList, () {
      super.cardsList = value;
    });
  }

  final _$checkListAtom = Atom(name: '_CheckoutState.checkList');

  @override
  ObservableList<bool> get checkList {
    _$checkListAtom.reportRead();
    return super.checkList;
  }

  @override
  set checkList(ObservableList<bool> value) {
    _$checkListAtom.reportWrite(value, super.checkList, () {
      super.checkList = value;
    });
  }

  final _$paymentMethodSelectorAtom =
      Atom(name: '_CheckoutState.paymentMethodSelector');

  @override
  ObservableList<bool> get paymentMethodSelector {
    _$paymentMethodSelectorAtom.reportRead();
    return super.paymentMethodSelector;
  }

  @override
  set paymentMethodSelector(ObservableList<bool> value) {
    _$paymentMethodSelectorAtom.reportWrite(value, super.paymentMethodSelector,
        () {
      super.paymentMethodSelector = value;
    });
  }

  final _$bundleListAtom = Atom(name: '_CheckoutState.bundleList');

  @override
  ObservableList<BundleModel> get bundleList {
    _$bundleListAtom.reportRead();
    return super.bundleList;
  }

  @override
  set bundleList(ObservableList<BundleModel> value) {
    _$bundleListAtom.reportWrite(value, super.bundleList, () {
      super.bundleList = value;
    });
  }

  final _$serviceListAtom = Atom(name: '_CheckoutState.serviceList');

  @override
  ObservableList<ServiceModel> get serviceList {
    _$serviceListAtom.reportRead();
    return super.serviceList;
  }

  @override
  set serviceList(ObservableList<ServiceModel> value) {
    _$serviceListAtom.reportWrite(value, super.serviceList, () {
      super.serviceList = value;
    });
  }

  final _$selectedPatientModelAtom =
      Atom(name: '_CheckoutState.selectedPatientModel');

  @override
  PatientModel? get selectedPatientModel {
    _$selectedPatientModelAtom.reportRead();
    return super.selectedPatientModel;
  }

  @override
  set selectedPatientModel(PatientModel? value) {
    _$selectedPatientModelAtom.reportWrite(value, super.selectedPatientModel,
        () {
      super.selectedPatientModel = value;
    });
  }

  final _$shippingAtom = Atom(name: '_CheckoutState.shipping');

  @override
  int get shipping {
    _$shippingAtom.reportRead();
    return super.shipping;
  }

  @override
  set shipping(int value) {
    _$shippingAtom.reportWrite(value, super.shipping, () {
      super.shipping = value;
    });
  }

  final _$deliveryDateAtom = Atom(name: '_CheckoutState.deliveryDate');

  @override
  DateTime? get deliveryDate {
    _$deliveryDateAtom.reportRead();
    return super.deliveryDate;
  }

  @override
  set deliveryDate(DateTime? value) {
    _$deliveryDateAtom.reportWrite(value, super.deliveryDate, () {
      super.deliveryDate = value;
    });
  }

  final _$deliveryTimeAtom = Atom(name: '_CheckoutState.deliveryTime');

  @override
  TimeOfDay? get deliveryTime {
    _$deliveryTimeAtom.reportRead();
    return super.deliveryTime;
  }

  @override
  set deliveryTime(TimeOfDay? value) {
    _$deliveryTimeAtom.reportWrite(value, super.deliveryTime, () {
      super.deliveryTime = value;
    });
  }

  final _$selectedCreditCardAtom =
      Atom(name: '_CheckoutState.selectedCreditCard');

  @override
  CreditCardModel? get selectedCreditCard {
    _$selectedCreditCardAtom.reportRead();
    return super.selectedCreditCard;
  }

  @override
  set selectedCreditCard(CreditCardModel? value) {
    _$selectedCreditCardAtom.reportWrite(value, super.selectedCreditCard, () {
      super.selectedCreditCard = value;
    });
  }

  final _$subTotalAtom = Atom(name: '_CheckoutState.subTotal');

  @override
  int get subTotal {
    _$subTotalAtom.reportRead();
    return super.subTotal;
  }

  @override
  set subTotal(int value) {
    _$subTotalAtom.reportWrite(value, super.subTotal, () {
      super.subTotal = value;
    });
  }

  final _$getCardsAsyncAction = AsyncAction('_CheckoutState.getCards');

  @override
  Future<void> getCards() {
    return _$getCardsAsyncAction.run(() => super.getCards());
  }

  final _$makeDefaultAsyncAction = AsyncAction('_CheckoutState.makeDefault');

  @override
  Future<void> makeDefault(int id) {
    return _$makeDefaultAsyncAction.run(() => super.makeDefault(id));
  }

  final _$buyProductAsyncAction = AsyncAction('_CheckoutState.buyProduct');

  @override
  Future<String> buyProduct(
      BuildContext context, AddressModel defaultAddress, bool rememberCard) {
    return _$buyProductAsyncAction
        .run(() => super.buyProduct(context, defaultAddress, rememberCard));
  }

  final _$getShippingPriceAsyncAction =
      AsyncAction('_CheckoutState.getShippingPrice');

  @override
  Future<void> getShippingPrice(double lat, double lng) {
    return _$getShippingPriceAsyncAction
        .run(() => super.getShippingPrice(lat, lng));
  }

  final _$checkPaymentStatusAsyncAction =
      AsyncAction('_CheckoutState.checkPaymentStatus');

  @override
  Future<void> checkPaymentStatus(String vendorOrderId) {
    return _$checkPaymentStatusAsyncAction
        .run(() => super.checkPaymentStatus(vendorOrderId));
  }

  final _$deleteCardAsyncAction = AsyncAction('_CheckoutState.deleteCard');

  @override
  Future<void> deleteCard(int id) {
    return _$deleteCardAsyncAction.run(() => super.deleteCard(id));
  }

  final _$_CheckoutStateActionController =
      ActionController(name: '_CheckoutState');

  @override
  void getSubtotal() {
    final _$actionInfo = _$_CheckoutStateActionController.startAction(
        name: '_CheckoutState.getSubtotal');
    try {
      return super.getSubtotal();
    } finally {
      _$_CheckoutStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkoutList: ${checkoutList},
cardsList: ${cardsList},
checkList: ${checkList},
paymentMethodSelector: ${paymentMethodSelector},
bundleList: ${bundleList},
serviceList: ${serviceList},
selectedPatientModel: ${selectedPatientModel},
shipping: ${shipping},
deliveryDate: ${deliveryDate},
deliveryTime: ${deliveryTime},
selectedCreditCard: ${selectedCreditCard},
subTotal: ${subTotal}
    ''';
  }
}
