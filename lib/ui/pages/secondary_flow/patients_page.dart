import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/store/patients/patients_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/add_text_button.dart';
import 'package:cursus_app/ui/widgets/cursus_icons.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  PatientState patientState = PatientState();

  @override
  void initState() {
    super.initState();
    patientState.pagingController.addPageRequestListener((_) {
      patientState.getPatients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'keywords.patients',
        toolBarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Observer(
                  builder: (_) => patientState.storeState.state ==
                          StoreStates.loading
                      ? Loading(
                          color: Colors.transparent,
                        )
                      : PagedListView<int, PatientModel>(
                          pagingController: patientState.pagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<PatientModel>(
                            itemBuilder: (context, item, index) => _PatientCard(
                              patientState: patientState,
                              patientModel: item,
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AddTextButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(AddNewPatientRoute(patientState: patientState));
                  },
                  name: 'addNewPatient',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientCard extends StatelessWidget {
  final PatientModel patientModel;
  PatientState patientState = PatientState();

  _PatientCard({
    required this.patientModel,
    required this.patientState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              patientModel.profilePicture == null ||
                      patientModel.profilePicture!.isEmpty
                  ? 'https://api.cursus.am/profile_icon.png'
                  : 'https://api.cursus.am/${patientModel.profilePicture}',
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        patientModel.firstName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        patientModel.lastName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                AutoRouter.of(context).push(
                  AddNewPatientRoute(
                      id: patientModel.id, patientState: patientState),
                );
              },
              icon: Icon(
                CursusIcons.edit,
              ),
            ),
            IconButton(
              onPressed: () async {
                await patientState.deletePatients(patientModel.id);
                patientState.pagingController.refresh();
                //  await patientState.getPatients();
              },
              icon: Icon(
                CursusIcons.delete,
              ),
            )
          ],
        ),
        Divider(
          height: 40,
          thickness: 1.5,
        ),
      ],
    );
  }
}
