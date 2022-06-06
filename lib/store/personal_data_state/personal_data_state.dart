import 'dart:io';

import 'package:cursus_app/data/repository/user_repository.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'personal_data_state.g.dart';

class PersonalDataState = _PersonalDataState with _$PersonalDataState;

abstract class _PersonalDataState with Store {
  final StoreState storeState = StoreState();
  UserRepository userRepository = UserRepository();


  @observable
  UserModel? user;

  Observable<UserModel?> _currentUser = Observable<UserModel?>(null);

  @computed
  UserModel get currentUser => _currentUser.value!;

  @computed
  set currentUser(currentUser) => _currentUser.value = currentUser;

  @observable
  String gender = 'male';

  @observable
  DateTime? birthDate;

  @observable
  File? selectedImage;

  @action
  void setFirstName(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(firstName: value);
    }
  }

  @action
  void setLastName(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(lastName: value);
    }
  }

  @action
  void setEmail(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(email: value);
    }
  }

  @action
  void setPhoneNumber(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(phone: value);
    }
  }

  @action
  void setCountry(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(country: value);
    }
  }

  @action
  void setCity(String value) {
    if (value.isNotEmpty) {
      user = user!.copyWith(city: value);
    }
  }

  @action
  void setBirthDate(DateTime value) {
    user = user!.copyWith(birthDate: value);
  }

  @action
  void setGender(String value) {
    user = user!.copyWith(gender: value);
    gender = value;
  }

  @action
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = File(image.path);
        updateAvatar();

      }
    } catch (e) {
      storeState.setErrorMessage('Couldnt pick image from gallery');
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> getUser() async {
    try {
      storeState.changeState(StoreStates.loading);
      user = await userRepository.getUser();
      StorageHelper.setUserName(user!.firstName);
      StorageHelper.setUseSurname(user!.lastName);
      StorageHelper.setPhoneNumber(user!.phone);
      StorageHelper.setEmail(user!.phone);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  Future<void> updateUser() async {
    try {
      storeState.changeState(StoreStates.loading);
      await userRepository.updateUser(user!);

      storeState.setSuccessMessage('userUpdatedSuccessfully'.tr());
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  Future<void> updateAvatar() async {
    try {
      storeState.changeState(StoreStates.loading);
      if (selectedImage != null) {
        await userRepository.uploadProfilePic(
          selectedImage!,
        );
      }
      storeState.setSuccessMessage('User info updated successfully');
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }


}
