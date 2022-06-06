// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerifyAccountState on _VerifyAccountState, Store {
  final _$otpCodeAtom = Atom(name: '_VerifyAccountState.otpCode');

  @override
  String get otpCode {
    _$otpCodeAtom.reportRead();
    return super.otpCode;
  }

  @override
  set otpCode(String value) {
    _$otpCodeAtom.reportWrite(value, super.otpCode, () {
      super.otpCode = value;
    });
  }

  final _$userVerifyTokenAtom =
      Atom(name: '_VerifyAccountState.userVerifyToken');

  @override
  String get userVerifyToken {
    _$userVerifyTokenAtom.reportRead();
    return super.userVerifyToken;
  }

  @override
  set userVerifyToken(String value) {
    _$userVerifyTokenAtom.reportWrite(value, super.userVerifyToken, () {
      super.userVerifyToken = value;
    });
  }

  final _$resendVerifyCodeAsyncAction =
      AsyncAction('_VerifyAccountState.resendVerifyCode');

  @override
  Future<void> resendVerifyCode(String phoneNumber) {
    return _$resendVerifyCodeAsyncAction
        .run(() => super.resendVerifyCode(phoneNumber));
  }

  final _$verifyAccountAsyncAction =
      AsyncAction('_VerifyAccountState.verifyAccount');

  @override
  Future<void> verifyAccount(BuildContext context) {
    return _$verifyAccountAsyncAction.run(() => super.verifyAccount(context));
  }

  final _$_VerifyAccountStateActionController =
      ActionController(name: '_VerifyAccountState');

  @override
  void setOtpCode(String value) {
    final _$actionInfo = _$_VerifyAccountStateActionController.startAction(
        name: '_VerifyAccountState.setOtpCode');
    try {
      return super.setOtpCode(value);
    } finally {
      _$_VerifyAccountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
otpCode: ${otpCode},
userVerifyToken: ${userVerifyToken}
    ''';
  }
}
