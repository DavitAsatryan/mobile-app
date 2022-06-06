import 'package:cursus_app/data/repository/address_repository.dart';
import 'package:cursus_app/model/address/address_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'address_state.g.dart';

class AddressState = _AddressState with _$AddressState;

abstract class _AddressState with Store {
  final AddressRepository addressRepository = AddressRepository();
  final StoreState storeState = StoreState();
  final StoreState searchState = StoreState();

  int bundlesOffset = 0;

  @observable
  ObservableList<AddressModel> addressList = <AddressModel>[].asObservable();

  @observable
  AddressModel selectedAddress = AddressModel();

  @observable
  AddressModel defaultAddress = AddressModel();

  @observable
  ObservableList<bool> checkList = <bool>[].asObservable();

  @action
  Future<void> getAddresses() async {
    try {
      storeState.changeState(StoreStates.loading);
      addressList.clear();
      List<AddressModel> addresses = await addressRepository.getAddresses();
      addressList.addAll(addresses);
      checkList.clear();
      for (int i = 0; i < addressList.length; i++) {
        if (addressList[i].isDefault!) {
          defaultAddress = addressList[i];
          checkList.add(true);
        } else {
          checkList.add(false);
        }
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
      addressRepository.makeDefault(id);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> createAddress() async {
    {
      try {
        storeState.changeState(StoreStates.loading);
        await addressRepository.createAddress(selectedAddress);
        storeState.changeState(StoreStates.success);
      } catch (e) {
        storeState.setErrorMessage(e.toString());
        storeState.changeState(StoreStates.error);
      }
    }
  }

  @action
  Future<void> deleteAddress(int id) async {
    {
      try {
        storeState.changeState(StoreStates.loading);
        await addressRepository.deleteAddress(id);
        storeState.changeState(StoreStates.success);
      } catch (e) {
        storeState.setErrorMessage(e.toString());
        storeState.changeState(StoreStates.error);
      }
    }
  }

  @action
  Future<void> getAddressFromLatLng(LatLng point) async {
    {
      try {
        storeState.changeState(StoreStates.loading);
        final res = await addressRepository.getAddressFromLatLng(point);
        selectedAddress = selectedAddress.copyWith(
            address: res,
            longitude: point.longitude,
            latitude: point.latitude,
            isDefault: false);
        storeState.changeState(StoreStates.success);
      } catch (e) {
        storeState.setErrorMessage(e.toString());
        storeState.changeState(StoreStates.error);
      }
    }
  }
}
