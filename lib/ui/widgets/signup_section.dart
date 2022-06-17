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
  final String? groupValue;
  final ValueChanged<String?>? onChanged;
  static bool validHide = false;

  SignUpSection({
    required this.authorizationState,
    this.groupValue,
    this.onChanged,
    this.value,
    Key? key,
  }) : super(key: key);

  SignUpSection.Gender(
      {this.authorizationState,
      required this.groupValue,
      required this.onChanged,
      required this.value});
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
    print('value ${genderValid}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (groupValue == 1) {
        genderValid = false;
        selectedGender = 'male';
        print(selectedGender);
      } else if (groupValue == 2) {
        genderValid = false;
        selectedGender = 'female';
        print(selectedGender);
      }

      if (agreeValue == 1) {
        agreeValidOne = false;
      }
      if (agreeValueTwo == 1) {
        agreeValidTwo = false;
      }
    });

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
                Observer(
                  builder: (_) => TextInput(
                    onChanged: (value) =>
                        widget.authorizationState?.firstName = value,
                    textInputAction: TextInputAction.next,
                    hintText: 'hints.name'.tr(),
                    errorText: widget.authorizationState?.errors.firstName,
                  ),
                ),
                Observer(
                  builder: (_) => TextInput(
                    onChanged: (value) =>
                        widget.authorizationState?.lastName = value,
                    textInputAction: TextInputAction.next,
                    hintText: 'hints.surname'.tr(),
                    errorText: widget.authorizationState?.errors.lastName,
                  ),
                ),
                Observer(
                  builder: (_) => TextInput(
                    number: true,
                    onChanged: (value) =>
                        widget.authorizationState?.phoneNumber = value,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [maskFormatter],
                    hintText: 'hints.phoneNumber'.tr(),
                    keyboardType: TextInputType.phone,
                    errorText: widget.authorizationState?.errors.phoneNumber,
                  ),
                ),
                Observer(
                  builder: (_) => TextInput(
                    onChanged: (value) =>
                        widget.authorizationState?.password = value,
                    textInputAction: TextInputAction.next,
                    hasSuffix: true,
                    hintText: 'hints.password'.tr(),
                    errorText: widget.authorizationState?.errors.password,
                  ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: genderValid == true
                                      ? Color.fromARGB(255, 218, 5, 5)
                                      : Color.fromARGB(155, 0, 0, 0),
                                ),
                                child: Radio(
                                  activeColor: Colors.black,
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value!;
                                      widget.authorizationState?.gender =
                                          'male';
                                    });
                                  },
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
                              Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: genderValid == true
                                      ? Color.fromARGB(255, 218, 5, 5)
                                      : Color.fromARGB(155, 0, 0, 0),
                                ),
                                child: Radio(
                                  value: 2,
                                  groupValue: groupValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      groupValue = value!;
                                      widget.authorizationState?.gender =
                                          'female';
                                    });
                                  },
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 3),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Observer(
                          builder: (_) => Theme(
                            data: ThemeData(
                              unselectedWidgetColor: agreeValidOne == true
                                  ? Color.fromARGB(255, 218, 5, 5)
                                  : AppColors.dashboardTextColor,
                            ),
                            child: Checkbox(
                              activeColor: white,
                              checkColor: AppColors.dashboardTextColor,
                              value: widget.authorizationState
                                  ?.agreedToTermsAndConditions,
                              onChanged: (_) {
                                widget.authorizationState
                                    ?.setAgreedToTermsAndConditions();
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
                                builder: (context) => Observer(
                                  builder: (_) => const TermsAndConditions(),
                                ),
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
                      Observer(
                        builder: (_) => Theme(
                          data: ThemeData(
                            unselectedWidgetColor: agreeValidTwo == true
                                ? Color.fromARGB(255, 218, 5, 5)
                                : AppColors.dashboardTextColor,
                          ),
                          child: Checkbox(
                            activeColor: white,
                            checkColor: AppColors.dashboardTextColor,
                            value: widget
                                .authorizationState?.agreedToSmsNotification,
                            onChanged: (_) {
                              widget.authorizationState
                                  ?.setAgreedToSmsNotification();
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
      ),
    );
  }
}
