// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_patient_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPatientState on _AddPatientState, Store {
  final _$firstNameAtom = Atom(name: '_AddPatientState.firstName');

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

  final _$lastNameAtom = Atom(name: '_AddPatientState.lastName');

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

  final _$emailAtom = Atom(name: '_AddPatientState.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_AddPatientState.phoneNumber');

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

  final _$birthDateAtom = Atom(name: '_AddPatientState.birthDate');

  @override
  DateTime? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$genderAtom = Atom(name: '_AddPatientState.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$countryAtom = Atom(name: '_AddPatientState.country');

  @override
  String? get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String? value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$cityAtom = Atom(name: '_AddPatientState.city');

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$selectedImageAtom = Atom(name: '_AddPatientState.selectedImage');

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_AddPatientState.imageUrl');

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$patientModelAtom = Atom(name: '_AddPatientState.patientModel');

  @override
  PatientModel? get patientModel {
    _$patientModelAtom.reportRead();
    return super.patientModel;
  }

  @override
  set patientModel(PatientModel? value) {
    _$patientModelAtom.reportWrite(value, super.patientModel, () {
      super.patientModel = value;
    });
  }

  final _$pickImageAsyncAction = AsyncAction('_AddPatientState.pickImage');

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  final _$_AddPatientStateActionController =
      ActionController(name: '_AddPatientState');

  @override
  void setFirstName(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileImage(String image) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setProfileImage');
    try {
      return super.setProfileImage(image);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(DateTime value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setCountry');
    try {
      return super.setCountry(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validateFirstName');
    try {
      return super.validateFirstName(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validateLastName');
    try {
      return super.validateLastName(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCity(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validateCity');
    try {
      return super.validateCity(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCountry(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validateCountry');
    try {
      return super.validateCountry(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validateEmail');
    try {
      return super.validateEmail(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhone(dynamic _) {
    final _$actionInfo = _$_AddPatientStateActionController.startAction(
        name: '_AddPatientState.validatePhone');
    try {
      return super.validatePhone(_);
    } finally {
      _$_AddPatientStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
phoneNumber: ${phoneNumber},
birthDate: ${birthDate},
gender: ${gender},
country: ${country},
city: ${city},
selectedImage: ${selectedImage},
imageUrl: ${imageUrl},
patientModel: ${patientModel}
    ''';
  }
}

mixin _$AddPatientStateErrors on _AddPatientStateErrors, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_AddPatientStateErrors.hasErrors'))
          .value;

  final _$firstNameAtom = Atom(name: '_AddPatientStateErrors.firstName');

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

  final _$lastNameAtom = Atom(name: '_AddPatientStateErrors.lastName');

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

  final _$emailAtom = Atom(name: '_AddPatientStateErrors.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_AddPatientStateErrors.phoneNumber');

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

  final _$dobAtom = Atom(name: '_AddPatientStateErrors.dob');

  @override
  String? get dob {
    _$dobAtom.reportRead();
    return super.dob;
  }

  @override
  set dob(String? value) {
    _$dobAtom.reportWrite(value, super.dob, () {
      super.dob = value;
    });
  }

  final _$countryAtom = Atom(name: '_AddPatientStateErrors.country');

  @override
  String? get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String? value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$cityAtom = Atom(name: '_AddPatientStateErrors.city');

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
phoneNumber: ${phoneNumber},
dob: ${dob},
country: ${country},
city: ${city},
hasErrors: ${hasErrors}
    ''';
  }
}
