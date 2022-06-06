// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreState on _StoreState, Store {
  final _$stateAtom = Atom(name: '_StoreState.state');

  @override
  StoreStates get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreStates value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_StoreState.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$successMessageAtom = Atom(name: '_StoreState.successMessage');

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  final _$_StoreStateActionController = ActionController(name: '_StoreState');

  @override
  void changeState(StoreStates state) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String errorMessage) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.setErrorMessage');
    try {
      return super.setErrorMessage(errorMessage);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showOverlay() {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.showOverlay');
    try {
      return super.showOverlay();
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showSuccessOverlay() {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.showSuccessOverlay');
    try {
      return super.showSuccessOverlay();
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccessMessage(String message) {
    final _$actionInfo = _$_StoreStateActionController.startAction(
        name: '_StoreState.setSuccessMessage');
    try {
      return super.setSuccessMessage(message);
    } finally {
      _$_StoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
successMessage: ${successMessage}
    ''';
  }
}
