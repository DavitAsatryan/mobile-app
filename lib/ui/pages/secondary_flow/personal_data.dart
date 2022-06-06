import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/personal_data_state/personal_data_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/cursus_icons.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/date_picker_container.dart';
import 'package:cursus_app/ui/widgets/gender_picker.dart';
import 'package:cursus_app/ui/widgets/rounded_text_input.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  PersonalDataState personalDataState = PersonalDataState();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  var dateFormat = DateFormat('dd MMMM yyyy');

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    await personalDataState.getUser();
    _updateTextController(personalDataState.user!);
  }

  _updateTextController(UserModel user) {
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneNumberController.text = user.phone;

    if (user.email != null) {
      emailController.text = user.email!;
    }
    if (user.country != null) {
      countryController.text = user.country!;
    }
    if (user.city != null) {
      cityController.text = user.city!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.personalData',
        toolBarHeight: 50,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (personalDataState.storeState.state == StoreStates.loading ||
                personalDataState.storeState.state == StoreStates.initial) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _TextWithIconCard(
                            text: 'keywords.addresses',
                            iconData: CursusIcons.address,
                            onPressed: () {
                              AutoRouter.of(context).push(AddressesRoute());
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          _TextWithIconCard(
                            text: 'keywords.cards',
                            iconData: CursusIcons.credit_card,
                            onPressed: () {
                              AutoRouter.of(context).push(CardsRoute());
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          _TextWithIconCard(
                            text: 'keywords.patients',
                            iconData: CursusIcons.patients,
                            onPressed: () {
                              AutoRouter.of(context).push(PatientsRoute());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                        inputType: TextInputType.text,
                        hintText: 'John',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setFirstName(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
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
                        inputType: TextInputType.text,
                        hintText: 'Doe',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setLastName(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
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
                        inputType: TextInputType.text,
                        hintText: 'Johndoe@gmail.com',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setEmail(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
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
                        inputType: TextInputType.phone,
                        hintText: '+374(96)22999',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setPhoneNumber(value);
                        },
                      ),
                      Observer(
                        builder: (_) => DatePickerContainer(
                          label: 'dob',
                          hint: 'December 8, 1998',
                          value: personalDataState.user!.birthDate != null
                              ? dateFormat
                                  .format(personalDataState.user!.birthDate!)
                              : null,
                          // personalDataState.birthDate != null
                          //     ? DateFormat.yMMMd()
                          //         .format(personalDataState.user!.birthDate!)
                          //     : null,
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
                              personalDataState.user!
                                  .copyWith(birthDate: dateTime);
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Observer(
                        builder: (_) => GenderPicker(
                          selectedGender: personalDataState.user!.gender != null
                              ? personalDataState.user!.gender!
                              : 'null',
                          onChanged: (value) {
                            personalDataState.setGender(value!);
                            personalDataState.gender = value;
                          },
                        ),
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
                        inputType: TextInputType.text,
                        hintText: 'armenia',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setCountry(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
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
                        inputType: TextInputType.text,
                        hintText: 'yerevan',
                        obscureText: false,
                        onChanged: (value) {
                          personalDataState.setCity(value);
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      MainButton(
                        callback: () {
                          personalDataState.updateUser();
                        },
                        label: 'updateInfo',
                        // padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _TextWithIconCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;

  const _TextWithIconCard({
    required this.text,
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black400,
                  ),
                ).tr(),
                Icon(
                  iconData,
                  size: 35,
                  color: AppColors.black400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
