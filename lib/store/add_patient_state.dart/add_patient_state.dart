import 'dart:io';

import 'package:cursus_app/constants/regexp.dart';
import 'package:cursus_app/data/repository/patient_repository.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/model/patient/request_patient_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'add_patient_state.g.dart';

class AddPatientState = _AddPatientState with _$AddPatientState;

abstract class _AddPatientState with Store {
  final PatientRepository patientRepository = PatientRepository();
  final StoreState storeState = StoreState();

  _AddPatientState();

  final AddPatientStateErrors errors = AddPatientStateErrors();

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String? email;

  @observable
  String? phoneNumber;

  @observable
  DateTime? birthDate;

  @observable
  String gender = 'Male';

  @observable
  String? country;

  @observable
  String? city;

  @observable
  File? selectedImage;

  @observable
  String? imageUrl;

  @observable
  PatientModel? patientModel;

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setProfileImage(String image) {
    imageUrl = image;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPhoneNumber(String value) {
    phoneNumber = value;
  }

  @action
  void setBirthDate(DateTime value) {
    birthDate = value;
  }

  @action
  void setGender(String value) {
    gender = value;
  }

  @action
  void setCountry(String value) {
    country = value;
  }

  @action
  void setCity(String value) {
    city = value;
  }

  @action
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = File(image.path);
      }
    } catch (e) {
      storeState.setErrorMessage('localValidationErrors.imageIssues');
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  void validateFirstName(_) {
    if (firstName.trim().isEmpty || firstName.trim().length < 3) {
      errors.firstName = "localValidationErrors.firstNameValidate";
    } else {
      errors.firstName = null;
    }
  }

  @action
  void validateLastName(_) {
    if (lastName.trim().isEmpty || lastName.trim().length < 3) {
      errors.lastName = "localValidationErrors.lastNameValidate";
    } else {
      errors.lastName = null;
    }
  }

  @action
  void validateCity(_) {
    if (city!.trim().isEmpty || city!.trim().length < 3) {
      errors.city = "localValidationErrors.cityRequired";
    } else {
      errors.city = null;
    }
  }

  @action
  void validateCountry(_) {
    if (country!.trim().isEmpty || country!.trim().length < 3) {
      errors.country = "localValidationErrors.countryRequired";
    } else {
      errors.country = null;
    }
  }

  @action
  void validateEmail(_) {
    if (email!.trim().isEmpty) {
      errors.email = "localValidationErrors.emailRequired";
    } else if (!RegExp(emailRegExp).hasMatch(email!)) {
      errors.email = "localValidationErrors.invalidEmail";
    } else {
      errors.email = null;
    }
  }

  @action
  void validatePhone(_) {
    if (phoneNumber!.trim().isEmpty) {
      errors.phoneNumber = "localValidationErrors.phoneRequired";
    } else if (!RegExp(phoneNumberRegexp).hasMatch(phoneNumber!)) {
      errors.phoneNumber = "localValidationErrors.invalidPhoneNumber";
    } else {
      errors.phoneNumber = null;
    }
  }

  Future<void> addPatient() async {
    RequestPatientModel patientModel = RequestPatientModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phoneNumber,
      birthDate: birthDate,
      gender: gender,
      country: country,
      city: city,
    );
    try {
      storeState.changeState(StoreStates.loading);
      PatientModel createdPatient =
          await patientRepository.addPatient(patientModel);
      if (selectedImage != null) {
        await patientRepository.uploadProfilePic(
          createdPatient.id,
          selectedImage!,
        );
      }
      storeState.setSuccessMessage('addedSuccessfully');
      storeState.changeState(StoreStates.success);
    } catch (e) {
      print('exception is : $e');
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  Future<void> getPatientById(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      patientModel = await patientRepository.getPatientById(id);
      storeState.changeState(StoreStates.success);

      setPhoneNumber(patientModel!.phone ?? '');
      setGender(patientModel!.gender ?? '');
      setFirstName(patientModel!.firstName);
      setLastName(patientModel!.lastName);
      setCity(patientModel!.user!.city ?? '');
      setCountry(patientModel!.user!.country ?? '');
      setBirthDate(patientModel!.user!.birthDate ?? DateTime.now());
      setGender(patientModel!.gender ?? '');
    } catch (e) {
      print('exception is : $e');
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }


  Future<void> updatePatient() async {
    RequestPatientModel patient = RequestPatientModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phoneNumber,
      birthDate: birthDate,
      gender: gender,
      country: country,
      city: city,
    );
    try {
      storeState.changeState(StoreStates.loading);
      patientRepository.updatePatient(patientModel!.id, patient);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      print('exception is : $e');
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => email, validateEmail),
      reaction((_) => phoneNumber, validatePhone),
      reaction((_) => country, validateCountry),
      reaction((_) => city, validateCity),
      reaction((_) => email, validateEmail),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class AddPatientStateErrors = _AddPatientStateErrors
    with _$AddPatientStateErrors;

abstract class _AddPatientStateErrors with Store {
  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? email;

  @observable
  String? phoneNumber;

  @observable
  String? dob;

  @observable
  String? country;

  @observable
  String? city;

  @computed
  bool get hasErrors =>
      firstName != null ||
      lastName != null ||
      city != null ||
      dob != null ||
      country != null ||
      phoneNumber != null ||
      email != null;
}
