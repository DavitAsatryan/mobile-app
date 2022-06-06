import 'package:cursus_app/data/repository/patient_repository.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'patients_state.g.dart';

class PatientState = _PatientState with _$PatientState;

abstract class _PatientState with Store {
  final PatientRepository patientRepository = PatientRepository();
  final StoreState storeState = StoreState();

  _PatientState() {}

  static const fetchLimit = 20;

  PagingController<int, PatientModel> pagingController =
      PagingController<int, PatientModel>(firstPageKey: 0);

  int currentOffset = 0;

  @observable
  ObservableList<PatientModel> patientList = <PatientModel>[].asObservable();

  @observable
  ObservableList<bool> checkList = <bool>[].asObservable();

  @observable
  int selectedPatientIndex = 0;

  @action
  Future<void> getPatientsWithoutPagination() async {
    storeState.changeState(StoreStates.loading);
    List<PatientModel> patients =
        await patientRepository.getPatinetsWithoutPagination();
    patientList.clear();
    patientList.addAll(patients);
    checkList.clear();
    for (int i = 0; i < patientList.length; i++) {
      if (i != selectedPatientIndex) {
        checkList.add(false);
      } else {
        checkList.add(true);
      }
    }
    storeState.changeState(StoreStates.success);
  }

  @action
  Future<void> getPatients() async {
    try {
      storeState.changeState(StoreStates.loading);
      List<PatientModel> patients = await patientRepository.getPatinets(
        offset: currentOffset,
        limit: fetchLimit,
      );
      final isLastPage = patients.length < fetchLimit;
      if (isLastPage) {
        pagingController.appendLastPage(patients);
      } else {
        currentOffset += patients.length;
        pagingController.appendPage(patients, currentOffset);
      }
      if (patients.isEmpty) {
        storeState.changeState(StoreStates.empty);
      } else {
        storeState.changeState(StoreStates.success);
      }
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> deletePatients(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      await patientRepository.deletePatient(id);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }
}
