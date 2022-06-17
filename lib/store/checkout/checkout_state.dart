import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/data/repository/checkout_repository.dart';
import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/model/address/address_model.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/model/credit_card/credit_card_model.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/model/shopping_cart/shipping_cart_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:cursus_app/router.gr.dart';

part 'checkout_state.g.dart';

class CheckoutState = _CheckoutState with _$CheckoutState;

abstract class _CheckoutState with Store {
  final checkoutRepository = CheckoutRepository();
  final StoreState storeState = StoreState();

  @observable
  ObservableList<ShoppingCartModel> checkoutList =
      <ShoppingCartModel>[].asObservable();

  @observable
  ObservableList<CreditCardModel> cardsList =
      <CreditCardModel>[].asObservable();

  @observable
  ObservableList<bool> checkList = <bool>[].asObservable();

  @observable
  ObservableList<bool> paymentMethodSelector =
      <bool>[true, false].asObservable();

  @observable
  ObservableList<BundleModel> bundleList = <BundleModel>[].asObservable();

  @observable
  ObservableList<ServiceModel> serviceList = <ServiceModel>[].asObservable();

  @observable
  PatientModel? selectedPatientModel;

  @observable
  int shipping = 0;

  @observable
  DateTime? deliveryDate = DateTime.now().add(Duration(days: 2));

  @observable
  TimeOfDay? deliveryTime = TimeOfDay.now();

  @observable
  CreditCardModel? selectedCreditCard;

  @observable
  int subTotal = 0;

  @action
  Future<void> getCards() async {
    try {
      storeState.changeState(StoreStates.loading);
      cardsList.clear();
      List<CreditCardModel> cards = await checkoutRepository.getCards();
      cardsList.addAll(cards);
      for (int i = 0; i < cardsList.length + 1; i++) {
        checkList.add(false);
      }
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> makeDefault(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      checkoutRepository.makeCardDefault(id);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<String> buyProduct(BuildContext context, AddressModel defaultAddress,
      bool rememberCard) async {
    DateTime appointmentDate = DateTime(deliveryDate!.year, deliveryDate!.month,
        deliveryDate!.day, deliveryTime!.hour, deliveryTime!.minute);
    try {
      storeState.changeState(StoreStates.loading);
      var res = await checkoutRepository.buyProduct(
          defaultAddress.latitude!,
          defaultAddress.longitude!,
          defaultAddress.address!,
          paymentMethodSelector.first == true ? 'cash' : 'card',
          selectedCreditCard != null ? selectedCreditCard!.id : -1,
          rememberCard,
          serviceList,
          bundleList,
          selectedPatientModel!,
          appointmentDate);

      if (paymentMethodSelector.first == false) {
        res[0].isNotEmpty
            ? AutoRouter.of(context).replace(
                ArcaPaymentRoute(redirectUrl: res[0], vendorOrderId: res[1]))
            : checkPaymentStatus(res[1]);
      } else {
        showCustomOverlayNotification(
          color: AppColors.purpleLight,
          text: 'paymentSuccessfullyProceeded'.tr(),
        );
        checkoutList.clear();
        serviceList.clear();
        bundleList.clear();
        AutoRouter.of(context).replace(DashboardRoute());
      }

      storeState.changeState(StoreStates.success);
      return res[0];
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
      return e.toString();
    }
  }

  @action
  Future<void> getShippingPrice(double lat, double lng) async {
    try {
      storeState.changeState(StoreStates.loading);
      shipping = await checkoutRepository.getShippingPrice(lat, lng);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> checkPaymentStatus(String vendorOrderId) async {
    try {
      storeState.changeState(StoreStates.loading);
      String res = await checkoutRepository.checkPaymentStatus(vendorOrderId);
      if (res == 'paid') {
        checkoutList.clear();
        serviceList.clear();
        bundleList.clear();
      }
      storeState.setSuccessMessage(res);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  void getSubtotal() {
    subTotal = 0;
    for (int i = 0; i < checkoutList.length; i++) {
      subTotal = subTotal + checkoutList[i].price;
    }
  }

  @action
  Future<void> deleteCard(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      checkoutRepository.deleteCard(id);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }
}
