import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/data/repository/authorization_repository.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:mobx/mobx.dart';

import '../../formatters.dart';

part 'forgot_password.g.dart';

class ForgotPasswordState = _ForgotPasswordState with _$ForgotPasswordState;

abstract class _ForgotPasswordState with Store {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  final StoreState storeState = StoreState();
  final ForgotPasswordErrors errors = ForgotPasswordErrors();

  late List<ReactionDisposer> _disposers;
  String? userVerifyToken;

  @observable
  String phone = '';

  @action
  void setPhone(String value) => phone = value;

  @observable
  String otp = '';

  @action
  void setOtp(String value) => otp = value;

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String value) => newPassword = value;

  @action
  void validatePhoneNumber(_) {
    final phoneNumber = this.phone.trim();
    if (phoneNumber.isEmpty) {
      errors.phone = "Phone number can't be empty";
    } else if (!RegExp(phoneNumberRegexp).hasMatch(phoneNumber) ||
        phone.length < 14) {
      errors.phone = 'Invalid phone number';
    } else {
      errors.phone = null;
    }
  }

  @action
  void validateNewPassword(_) {
    final password = this.newPassword.trim();
    if (password.isEmpty || password.length < 6) {
      errors.newPassword = 'Too short (more than 5)';
    } else if (!RegExp(passwordRegexp).hasMatch(password)) {
      errors.newPassword =
          'Password must contain at least : One capital letter, one number, one symbol';
    } else {
      errors.newPassword = null;
    }
  }

  @action
  Future<void> sendOtpCode() async {
    if (errors.phone == null) {
      try {
        storeState.changeState(StoreStates.loading);
        userVerifyToken = await authenticationRepo
            .forgotPassword('+${maskFormatter.getUnmaskedText()}');
        storeState.setSuccessMessage('smsSent'.tr());
        storeState.changeState(StoreStates.success);
      } on Exception catch (e) {
        storeState.setErrorMessage(e.toString());
        storeState.changeState(StoreStates.error);
      }
    }
  }

  @action
  Future<void> changePassword() async {
    if (errors.newPassword == null) {
      try {
        storeState.changeState(StoreStates.loading);
        await authenticationRepo.resetPassword(
            token: userVerifyToken!, key: otp, newPassword: newPassword);
        storeState.setSuccessMessage('passwordChanged'.tr());
        storeState.changeState(StoreStates.success);
      } on Exception catch (e) {
        storeState.setErrorMessage(e.toString());
        storeState.changeState(StoreStates.error);
      }
    }
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => phone, validatePhoneNumber),
      reaction((_) => newPassword, validateNewPassword),
    ];
  }

  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

class ForgotPasswordErrors = _ForgotPasswordErrors with _$ForgotPasswordErrors;

abstract class _ForgotPasswordErrors with Store {
  @observable
  String? phone;

  @observable
  String? newPassword;

  @computed
  bool get hasErrors => phone != null || newPassword != null;
}
