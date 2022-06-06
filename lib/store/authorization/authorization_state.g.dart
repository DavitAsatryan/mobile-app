// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthorizationState on _AuthorizationState, Store {
  final _$firstNameAtom = Atom(name: '_AuthorizationState.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_AuthorizationState.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_AuthorizationState.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthorizationState.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$phoneNumberLoginAtom =
      Atom(name: '_AuthorizationState.phoneNumberLogin');

  @override
  String get phoneNumberLogin {
    _$phoneNumberLoginAtom.reportRead();
    return super.phoneNumberLogin;
  }

  @override
  set phoneNumberLogin(String value) {
    _$phoneNumberLoginAtom.reportWrite(value, super.phoneNumberLogin, () {
      super.phoneNumberLogin = value;
    });
  }

  final _$passwordLoginAtom = Atom(name: '_AuthorizationState.passwordLogin');

  @override
  String get passwordLogin {
    _$passwordLoginAtom.reportRead();
    return super.passwordLogin;
  }

  @override
  set passwordLogin(String value) {
    _$passwordLoginAtom.reportWrite(value, super.passwordLogin, () {
      super.passwordLogin = value;
    });
  }

  final _$userVerifyTokenAtom =
      Atom(name: '_AuthorizationState.userVerifyToken');

  @override
  String? get userVerifyToken {
    _$userVerifyTokenAtom.reportRead();
    return super.userVerifyToken;
  }

  @override
  set userVerifyToken(String? value) {
    _$userVerifyTokenAtom.reportWrite(value, super.userVerifyToken, () {
      super.userVerifyToken = value;
    });
  }

  final _$agreedToSmsNotificationAtom =
      Atom(name: '_AuthorizationState.agreedToSmsNotification');

  @override
  bool get agreedToSmsNotification {
    _$agreedToSmsNotificationAtom.reportRead();
    return super.agreedToSmsNotification;
  }

  @override
  set agreedToSmsNotification(bool value) {
    _$agreedToSmsNotificationAtom
        .reportWrite(value, super.agreedToSmsNotification, () {
      super.agreedToSmsNotification = value;
    });
  }

  final _$agreedToTermsAndConditionsAtom =
      Atom(name: '_AuthorizationState.agreedToTermsAndConditions');

  @override
  bool get agreedToTermsAndConditions {
    _$agreedToTermsAndConditionsAtom.reportRead();
    return super.agreedToTermsAndConditions;
  }

  @override
  set agreedToTermsAndConditions(bool value) {
    _$agreedToTermsAndConditionsAtom
        .reportWrite(value, super.agreedToTermsAndConditions, () {
      super.agreedToTermsAndConditions = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_AuthorizationState.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$logInAsyncAction = AsyncAction('_AuthorizationState.logIn');

  @override
  Future<void> logIn(BuildContext context) {
    return _$logInAsyncAction.run(() => super.logIn(context));
  }

  final _$registerAsyncAction = AsyncAction('_AuthorizationState.register');

  @override
  Future<UserModel?> register(BuildContext context) {
    return _$registerAsyncAction.run(() => super.register(context));
  }

  final _$sendOtpCodeToServerAsyncAction =
      AsyncAction('_AuthorizationState.sendOtpCodeToServer');

  @override
  Future<void> sendOtpCodeToServer() {
    return _$sendOtpCodeToServerAsyncAction
        .run(() => super.sendOtpCodeToServer());
  }

  final _$_AuthorizationStateActionController =
      ActionController(name: '_AuthorizationState');

  @override
  void setFirstName(String value) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAgreedToSmsNotification() {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setAgreedToSmsNotification');
    try {
      return super.setAgreedToSmsNotification();
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAgreedToTermsAndConditions() {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.setAgreedToTermsAndConditions');
    try {
      return super.setAgreedToTermsAndConditions();
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validateFirstName');
    try {
      return super.validateFirstName(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validateLastName');
    try {
      return super.validateLastName(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validatePassword');
    try {
      return super.validatePassword(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNumber(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validatePhoneNumber');
    try {
      return super.validatePhoneNumber(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNumberLogin(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validatePhoneNumberLogin');
    try {
      return super.validatePhoneNumberLogin(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordLogin(dynamic _) {
    final _$actionInfo = _$_AuthorizationStateActionController.startAction(
        name: '_AuthorizationState.validatePasswordLogin');
    try {
      return super.validatePasswordLogin(_);
    } finally {
      _$_AuthorizationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
phoneNumber: ${phoneNumber},
password: ${password},
phoneNumberLogin: ${phoneNumberLogin},
passwordLogin: ${passwordLogin},
userVerifyToken: ${userVerifyToken},
agreedToSmsNotification: ${agreedToSmsNotification},
agreedToTermsAndConditions: ${agreedToTermsAndConditions}
    ''';
  }
}

mixin _$AuthorizationStateErrors on _AuthorizationStateErrors, Store {
  Computed<bool>? _$registerationHasErrorsComputed;

  @override
  bool get registerationHasErrors => (_$registerationHasErrorsComputed ??=
          Computed<bool>(() => super.registerationHasErrors,
              name: '_AuthorizationStateErrors.registerationHasErrors'))
      .value;
  Computed<bool>? _$loginHasErrorsComputed;

  @override
  bool get loginHasErrors =>
      (_$loginHasErrorsComputed ??= Computed<bool>(() => super.loginHasErrors,
              name: '_AuthorizationStateErrors.loginHasErrors'))
          .value;

  final _$firstNameAtom = Atom(name: '_AuthorizationStateErrors.firstName');

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_AuthorizationStateErrors.lastName');

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthorizationStateErrors.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_AuthorizationStateErrors.phoneNumber');

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$phoneNumberLoginAtom =
      Atom(name: '_AuthorizationStateErrors.phoneNumberLogin');

  @override
  String? get phoneNumberLogin {
    _$phoneNumberLoginAtom.reportRead();
    return super.phoneNumberLogin;
  }

  @override
  set phoneNumberLogin(String? value) {
    _$phoneNumberLoginAtom.reportWrite(value, super.phoneNumberLogin, () {
      super.phoneNumberLogin = value;
    });
  }

  final _$passwordLoginAtom =
      Atom(name: '_AuthorizationStateErrors.passwordLogin');

  @override
  String? get passwordLogin {
    _$passwordLoginAtom.reportRead();
    return super.passwordLogin;
  }

  @override
  set passwordLogin(String? value) {
    _$passwordLoginAtom.reportWrite(value, super.passwordLogin, () {
      super.passwordLogin = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
password: ${password},
phoneNumber: ${phoneNumber},
phoneNumberLogin: ${phoneNumberLogin},
passwordLogin: ${passwordLogin},
registerationHasErrors: ${registerationHasErrors},
loginHasErrors: ${loginHasErrors}
    ''';
  }
}
