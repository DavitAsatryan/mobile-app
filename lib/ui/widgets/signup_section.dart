import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/gender_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../constants/theme/app_theme.dart';
import '../../formatters.dart';
import '../../store/authorization/authorization_state.dart';
import '../../values/values.dart';
import 'bottom_sheet_dialog/terms_and_conditions.dart';
import 'text_input.dart';

class SignUpSection extends StatefulWidget {
  final String? value;

  final ValueChanged<String?>? onChanged;
  static bool validHide = false;

  SignUpSection({
    required this.authorizationState,
    this.onChanged,
    this.value,
    Key? key,
  }) : super(key: key);

  SignUpSection.Gender(
      {this.authorizationState, required this.onChanged, required this.value});
  final AuthorizationState? authorizationState;

  @override
  State<SignUpSection> createState() => SignUpSectionState();
}

class SignUpSectionState extends State<SignUpSection> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  static bool genderValid = false;
  static bool agreeValidOne = false;
  static bool agreeValidTwo = false;

  AuthorizationState authorizationState = AuthorizationState();
  static var formKey = GlobalKey<FormState>();

  static String selectedGender = '';

  static int groupValue = 0;
  static int agreeValue = 0;
  static int agreeValueTwo = 0;
  @override
  void initState() {
    // print('value ${SignUpSection.genderValid}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (SignUpSectionState.groupValue == 1) {
      setState(() {
        SignUpSectionState.genderValid = false;
      });
      selectedGender = 'male';
      print(selectedGender);
    } else if (SignUpSectionState.groupValue == 2) {
      setState(() {
        SignUpSectionState.genderValid = false;
      });
      selectedGender = 'female';
      print(selectedGender);
    }
    // if (SignUpSectionState.agreeValue == 1) {
    //   SignUpSectionState.agreeValidOne = false;
    // } else if (SignUpSectionState.agreeValueTwo == 2) {
    //   SignUpSectionState.agreeValidTwo = false;
    // }
    return SingleChildScrollView(
        child: Column(
      children: [
        Center(
          child: Text('signUp'.tr(), style: Styles.boldTextStyle),
        ),
        Form(
          autovalidateMode: SignUpSection.validHide == true
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: Column(
            children: [
              TextInput(
                onChanged: (value) =>
                    widget.authorizationState?.firstName = value,
                textInputAction: TextInputAction.next,
                hintText: 'hints.name'.tr(),
                errorText: widget.authorizationState?.errors.firstName,
              ),
              TextInput(
                onChanged: (value) =>
                    widget.authorizationState?.lastName = value,
                textInputAction: TextInputAction.next,
                hintText: 'hints.surname'.tr(),
                errorText: widget.authorizationState?.errors.lastName,
              ),
              TextInput(
                number: true,
                onChanged: (value) =>
                    widget.authorizationState?.phoneNumber = value,
                textInputAction: TextInputAction.next,
                inputFormatters: [maskFormatter],
                hintText: 'hints.phoneNumber'.tr(),
                keyboardType: TextInputType.phone,
                errorText: widget.authorizationState?.errors.phoneNumber,
              ),
              TextInput(
                onChanged: (value) =>
                    widget.authorizationState?.password = value,
                textInputAction: TextInputAction.next,
                hasSuffix: true,
                hintText: 'hints.password'.tr(),
                errorText: widget.authorizationState?.errors.password,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hints.gender'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              FormField(
                                validator: (value) {
                                  if (SignUpSectionState.groupValue != 1 ||
                                      SignUpSectionState.groupValue != 2) {
                                    SignUpSectionState.genderValid == true;
                                  } else {
                                    return null;
                                  }
                                },
                                builder: (field) => Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        SignUpSectionState.genderValid
                                            ? Color.fromARGB(255, 218, 5, 5)
                                            : Color.fromARGB(155, 0, 0, 0),
                                  ),
                                  child: Radio(
                                    activeColor: Colors.black,
                                    value: 1,
                                    groupValue: SignUpSectionState.groupValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        SignUpSectionState.groupValue = value!;
                                        print(SignUpSectionState.groupValue);
                                        widget.authorizationState?.gender =
                                            'male';
                                        field.didChange(value);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'hints.male'.tr(),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              FormField(
                                validator: (value) {
                                  if (SignUpSectionState.groupValue != 1 &&
                                      SignUpSectionState.groupValue != 2) {
                                    SignUpSectionState.genderValid = true;
                                  } else {
                                    SignUpSectionState.genderValid = false;

                                    return null;
                                  }
                                },
                                builder: (field) => Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        SignUpSectionState.genderValid == true
                                            ? Color.fromARGB(255, 218, 5, 5)
                                            : Color.fromARGB(155, 0, 0, 0),
                                  ),
                                  child: Radio(
                                    value: 2,
                                    groupValue: SignUpSectionState.groupValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        SignUpSectionState.groupValue = value!;
                                        print(SignUpSectionState.groupValue);
                                        widget.authorizationState?.gender =
                                            'female';
                                        field.didChange(value);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'hints.female'.tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 3),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FormField(
                        validator: (value) {
                          if (SignUpSectionState.agreeValue != 1) {
                            SignUpSectionState.agreeValidOne = true;
                          } else {
                            SignUpSectionState.agreeValidOne = false;
                            return null;
                          }
                        },
                        builder: (field) => Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                SignUpSectionState.agreeValidOne == true
                                    ? Color.fromARGB(255, 218, 5, 5)
                                    : AppColors.dashboardTextColor,
                          ),
                          child: Checkbox(
                            activeColor: white,
                            checkColor: AppColors.dashboardTextColor,
                            value: widget
                                .authorizationState?.agreedToTermsAndConditions,
                            onChanged: (_) {
                              SignUpSectionState.agreeValue = 1;
                              widget.authorizationState
                                  ?.setAgreedToTermsAndConditions();
                              field.didChange(_);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 'termsConditions'.tr().length > 19 ? 40 : 20,
                        child: Container(
                          child: GestureDetector(
                            onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const TermsAndConditions(),
                            ),
                            child: Text.rich(
                              TextSpan(
                                text: 'iAgreeWith'.tr(),
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    color: AppColors.blackColor),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'termsConditions'.tr(),
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.termsConditions,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 0),
                child: Row(
                  children: [
                    FormField(
                      validator: (value) {
                        if (SignUpSectionState.agreeValue != 2) {
                          SignUpSectionState.agreeValidTwo = true;
                        } else {
                          SignUpSectionState.agreeValidTwo = false;

                          return null;
                        }
                      },
                      builder: (field) => Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              SignUpSectionState.agreeValidTwo == true
                                  ? Color.fromARGB(255, 218, 5, 5)
                                  : AppColors.dashboardTextColor,
                        ),
                        child: Checkbox(
                          activeColor: white,
                          checkColor: AppColors.dashboardTextColor,
                          value: widget
                              .authorizationState?.agreedToSmsNotification,
                          onChanged: (_) {
                            SignUpSectionState.agreeValueTwo = 2;
                            widget.authorizationState
                                ?.setAgreedToSmsNotification();
                            field.didChange(_);
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: widget
                            .authorizationState?.setAgreedToSmsNotification,
                        child: Text(
                          'agreeReceiveNotif'.tr(),
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.blackColor),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
