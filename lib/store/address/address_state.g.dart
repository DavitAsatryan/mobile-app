// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressState on _AddressState, Store {
  final _$addressListAtom = Atom(name: '_AddressState.addressList');

  @override
  ObservableList<AddressModel> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(ObservableList<AddressModel> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  final _$selectedAddressAtom = Atom(name: '_AddressState.selectedAddress');

  @override
  AddressModel get selectedAddress {
    _$selectedAddressAtom.reportRead();
    return super.selectedAddress;
  }

  @override
  set selectedAddress(AddressModel value) {
    _$selectedAddressAtom.reportWrite(value, super.selectedAddress, () {
      super.selectedAddress = value;
    });
  }

  final _$defaultAddressAtom = Atom(name: '_AddressState.defaultAddress');

  @override
  AddressModel get defaultAddress {
    _$defaultAddressAtom.reportRead();
    return super.defaultAddress;
  }

  @override
  set defaultAddress(AddressModel value) {
    _$defaultAddressAtom.reportWrite(value, super.defaultAddress, () {
      super.defaultAddress = value;
    });
  }

  final _$checkListAtom = Atom(name: '_AddressState.checkList');

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

  final _$getAddressesAsyncAction = AsyncAction('_AddressState.getAddresses');

  @override
  Future<void> getAddresses() {
    return _$getAddressesAsyncAction.run(() => super.getAddresses());
  }

  final _$makeDefaultAsyncAction = AsyncAction('_AddressState.makeDefault');

  @override
  Future<void> makeDefault(int id) {
    return _$makeDefaultAsyncAction.run(() => super.makeDefault(id));
  }

  final _$createAddressAsyncAction = AsyncAction('_AddressState.createAddress');

  @override
  Future<void> createAddress() {
    return _$createAddressAsyncAction.run(() => super.createAddress());
  }

  final _$deleteAddressAsyncAction = AsyncAction('_AddressState.deleteAddress');

  @override
  Future<void> deleteAddress(int id) {
    return _$deleteAddressAsyncAction.run(() => super.deleteAddress(id));
  }

  final _$getAddressFromLatLngAsyncAction =
      AsyncAction('_AddressState.getAddressFromLatLng');

  @override
  Future<void> getAddressFromLatLng(LatLng point) {
    return _$getAddressFromLatLngAsyncAction
        .run(() => super.getAddressFromLatLng(point));
  }

  @override
  String toString() {
    return '''
addressList: ${addressList},
selectedAddress: ${selectedAddress},
defaultAddress: ${defaultAddress},
checkList: ${checkList}
    ''';
  }
}
