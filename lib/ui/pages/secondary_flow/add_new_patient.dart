import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/add_patient_state.dart/add_patient_state.dart';
import 'package:cursus_app/store/patients/patients_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/drop_down_icon.dart';
import 'package:cursus_app/ui/widgets/gender_picker.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/rounded_text_input.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class AddNewPatientPage extends StatefulWidget {
  final int? id;
  final PatientState patientState;
  const AddNewPatientPage({Key? key, this.id, required this.patientState})
      : super(key: key);

  @override
  _AddNewPatientPageState createState() => _AddNewPatientPageState();
}

class _AddNewPatientPageState extends State<AddNewPatientPage> {
  AddPatientState addPatientState = AddPatientState();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addPatientState.setupValidations();

    if (widget.id != null) {
      getPatient();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.id == null ? 'addNewPatient' : 'updatePatient',
        toolBarHeight: 50,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) => addPatientState.storeState.state ==
                  StoreStates.loading
              ? Loading(
                  color: Colors.transparent,
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Avatar(
                              selectedImage: addPatientState.selectedImage,
                              onPressed: () {
                                addPatientState.pickImage();
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'firstName',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: firstNameController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.text,
                              hintText: 'John',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setFirstName(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.firstName ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'secondName',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: lastNameController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.text,
                              hintText: 'Doe',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setLastName(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.lastName ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.text,
                              hintText: 'Johndoe@gmail.com',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setEmail(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.email ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'hints.phoneNumber',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: phoneNumberController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.phone,
                              hintText: '+374(96)22999',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setPhoneNumber(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.phoneNumber ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _CustomPicker(
                              label: 'dob',
                              hint: 'December 8, 1998',
                              value: addPatientState.birthDate != null
                                  ? DateFormat.yMMMd()
                                      .format(addPatientState.birthDate!)
                                  : null,
                              onPressed: () async {
                                DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialEntryMode: DatePickerEntryMode.input,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime.now(),
                                );
                                if (dateTime != null) {
                                  print(dateTime);
                                  addPatientState.setBirthDate(dateTime);
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GenderPicker(
                              selectedGender: addPatientState.gender,
                              onChanged: (value) {
                                addPatientState.setGender(value!);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'country',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: countryController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.text,
                              hintText: 'armenia',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setCountry(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.country ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'city',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ).tr(),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedTextInput(
                              controller: cityController,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.text,
                              hintText: 'yerevan',
                              obscureText: false,
                              onChanged: (value) {
                                addPatientState.setCity(value);
                              },
                            ),
                            Observer(
                              builder: (_) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  addPatientState.errors.city ?? '',
                                  style: TextStyle(
                                    color: AppColors.errorRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).tr(),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            MainButton(
                              callback: () async {
                                if (widget.id == null) {
                                  await addPatientState.addPatient();
                                } else {
                                  await addPatientState.updatePatient();
                                }
                                widget.patientState.pagingController.itemList!
                                    .clear();
                                await widget.patientState.getPatients();
                                widget.patientState.pagingController.refresh();

                                await AutoRouter.of(context).pop();
                              },
                              label: widget.id == null
                                  ? 'addNewPatient'
                                  : 'updatePatient',
                              padding: EdgeInsets.zero,
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (addPatientState.storeState.state == StoreStates.loading)
                      Loading(color: AppColors.grey250.withOpacity(0.3)),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //  reactionDisposer();
  }

  Future<void> getPatient() async {
    await addPatientState.getPatientById(widget.id!);

    print('kkkkkkkkkkkkkkkk ${addPatientState.patientModel}');
    firstNameController.text = addPatientState.patientModel!.firstName;
    lastNameController.text = addPatientState.patientModel!.lastName;
    emailController.text = addPatientState.patientModel!.email!;
    phoneNumberController.text = addPatientState.patientModel!.phone!;
    countryController.text = addPatientState.patientModel!.user!.country!;
    cityController.text = addPatientState.patientModel!.user!.city!;
  }
}

class _Avatar extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onPressed;

  const _Avatar({
    required this.selectedImage,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedImage == null
                  ? AppColors.grey100
                  : Colors.transparent,
              border: Border.all(width: 3, color: AppColors.purpleDots),
            ),
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onPressed,
              child: Material(
                color: Colors.transparent,
                elevation: 5,
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: AppColors.purpleDark,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomPicker extends StatelessWidget {
  final String label;
  final String hint;
  final VoidCallback onPressed;
  final String? value;

  const _CustomPicker({
    required this.label,
    required this.hint,
    required this.onPressed,
    this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ).tr(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.grey250,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value != null ? value! : hint,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            value != null ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                    DropDownIcon(
                      onPressed: () {},
                      isOpend: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
