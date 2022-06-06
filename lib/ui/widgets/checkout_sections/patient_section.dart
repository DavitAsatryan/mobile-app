import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/store/patients/patients_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:get_it/get_it.dart';

import '../drop_down_icon.dart';
import '../loading.dart';
import 'add_new_action_widget.dart';

class PatientSection extends StatefulWidget {
  const PatientSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PatientSection> createState() => _PatientSectionState();
}

class _PatientSectionState extends State<PatientSection> {
  final checkoutState = GetIt.I<CheckoutState>();
  bool isOpend = false;
  PatientState patientState = PatientState();

  @override
  void initState() {
    super.initState();
    getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => patientState.storeState.state == StoreStates.loading
          ? Loading(
              color: Colors.transparent,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: !isOpend
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'patient'.tr(),
                            style: TextStyle(
                              fontSize: 23,
                              color: AppColors.textDarkPurpleColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Observer(
                            builder: (_) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                checkoutState.selectedPatientModel == null
                                    ? _Avatar(
                                        photoUrl: patientState
                                            .patientList.first.profilePicture,
                                        size: 85,
                                        name: patientState
                                            .patientList.first.lastName,
                                        surName: patientState
                                            .patientList.first.lastName,
                                      )
                                    : _Avatar(
                                        photoUrl: checkoutState
                                            .selectedPatientModel!
                                            .profilePicture,
                                        size: 85,
                                        name: checkoutState
                                            .selectedPatientModel!.firstName,
                                        surName: checkoutState
                                            .selectedPatientModel!.lastName,
                                      ),
                                DropDownIcon(
                                  onPressed: () {
                                    isOpend = !isOpend;
                                    setState(() {});
                                  },
                                  isOpend: isOpend,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Material(
                        elevation: 2,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        'keywords.patients'.tr(),
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: AppColors.textDarkPurpleColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    DropDownIcon(
                                      onPressed: () {
                                        isOpend = !isOpend;
                                        setState(() {});
                                      },
                                      isOpend: isOpend,
                                    ),
                                  ],
                                ),
                                Observer(
                                  builder: (_) => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: patientState.patientList.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                AppColors.textPurpleColor),
                                        child: CheckboxListTile(
                                          dense: true,
                                          checkColor: AppColors.white,
                                          activeColor:
                                              AppColors.textPurpleColor,
                                          secondary: Icon(
                                            Icons.account_circle_outlined,
                                            color: AppColors.anotherPurple,
                                            size: 30,
                                          ),
                                          title: Text(patientState
                                                  .patientList[index]
                                                  .firstName +
                                              " " +
                                              patientState
                                                  .patientList[index].lastName),
                                          value: patientState.checkList[index],
                                          onChanged: (selected) async {
                                            for (int i = 0;
                                                i <
                                                    patientState
                                                        .checkList.length;
                                                i++) {
                                              patientState.checkList[i] = false;
                                            }
                                            checkoutState.selectedPatientModel =
                                                patientState.patientList[index];
                                            patientState.checkList[index] =
                                                selected!;
                                            if (selected) {
                                              patientState
                                                  .selectedPatientIndex = index;
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => AutoRouter.of(context)
                                      .push(
                                        AddNewPatientRoute(
                                            patientState: patientState),
                                      )
                                      .then((value) => patientState
                                          .getPatientsWithoutPagination()),
                                  child: AddNewActionWidget(
                                    itemName: 'Add New Patient',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
    );
  }

  Future<void> getPatients() async {
    await patientState.getPatientsWithoutPagination();
    if (checkoutState.selectedPatientModel == null) {
      checkoutState.selectedPatientModel = patientState.patientList.first;
    }
  }
}

class _Avatar extends StatelessWidget {
  final double size;
  final String name;
  final String surName;
  final String? photoUrl;

  const _Avatar({
    required this.size,
    required this.name,
    required this.surName,
    this.photoUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.network(
              photoUrl != null && photoUrl!.isNotEmpty
                  ? 'https://api.cursus.am/$photoUrl'
                  : 'https://api.cursus.am/profile_icon.png',
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  surName,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
