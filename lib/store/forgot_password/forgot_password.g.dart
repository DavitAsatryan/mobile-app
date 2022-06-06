// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordState on _ForgotPasswordState, Store {
  final _$phoneAtom = Atom(name: '_ForgotPasswordState.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$otpAtom = Atom(name: '_ForgotPasswordState.otp');

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  final _$newPasswordAtom = Atom(name: '_ForgotPasswordState.newPassword');

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  final _$sendOtpCodeAsyncAction =
      AsyncAction('_ForgotPasswordState.sendOtpCode');

  @override
  Future<void> sendOtpCode() {
    return _$sendOtpCodeAsyncAction.run(() => super.sendOtpCode());
  }

  final _$changePasswordAsyncAction =
      AsyncAction('_ForgotPasswordState.changePassword');

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  final _$_ForgotPasswordStateActionController =
      ActionController(name: '_ForgotPasswordState');

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_ForgotPasswordStateActionController.startAction(
        name: '_ForgotPasswordState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_ForgotPasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtp(String value) {
    final _$actionInfo = _$_ForgotPasswordStateActionController.startAction(
        name: '_ForgotPasswordState.setOtp');
    try {
      return super.setOtp(value);
    } finally {
      _$_ForgotPasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordStateActionController.startAction(
        name: '_ForgotPasswordState.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$_ForgotPasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNumber(dynamic _) {
    final _$actionInfo = _$_ForgotPasswordStateActionController.startAction(
        name: '_ForgotPasswordState.validatePhoneNumber');
    try {
      return super.validatePhoneNumber(_);
    } finally {
      _$_ForgotPasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNewPassword(dynamic _) {
    final _$actionInfo = _$_ForgotPasswordStateActionController.startAction(
        name: '_ForgotPasswordState.validateNewPassword');
    try {
      return super.validateNewPassword(_);
    } finally {
      _$_ForgotPasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phone: ${phone},
otp: ${otp},
newPassword: ${newPassword}
    ''';
  }
}

mixin _$ForgotPasswordErrors on _ForgotPasswordErrors, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ForgotPasswordErrors.hasErrors'))
          .value;

  final _$phoneAtom = Atom(name: '_ForgotPasswordErrors.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$newPasswordAtom = Atom(name: '_ForgotPasswordErrors.newPassword');

  @override
  String? get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String? value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  @override
  String toString() {
    return '''
phone: ${phone},
newPassword: ${newPassword},
hasErrors: ${hasErrors}
    ''';
  }
}
