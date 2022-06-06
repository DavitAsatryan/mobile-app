// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PatientState on _PatientState, Store {
  final _$patientListAtom = Atom(name: '_PatientState.patientList');

  @override
  ObservableList<PatientModel> get patientList {
    _$patientListAtom.reportRead();
    return super.patientList;
  }

  @override
  set patientList(ObservableList<PatientModel> value) {
    _$patientListAtom.reportWrite(value, super.patientList, () {
      super.patientList = value;
    });
  }

  final _$checkListAtom = Atom(name: '_PatientState.checkList');

  @override
  ObservableList<bool> get checkList {
    _$checkListAtom.reportRead();
    return super.checkList;
  }

  @override
  set checkList(ObservableList<bool> value) {
    _$checkListAtom.reportWrite(value, super.checkList, () {
      super.checkList = value;
    });
  }

  final _$selectedPatientIndexAtom =
      Atom(name: '_PatientState.selectedPatientIndex');

  @override
  int get selectedPatientIndex {
    _$selectedPatientIndexAtom.reportRead();
    return super.selectedPatientIndex;
  }

  @override
  set selectedPatientIndex(int value) {
    _$selectedPatientIndexAtom.reportWrite(value, super.selectedPatientIndex,
        () {
      super.selectedPatientIndex = value;
    });
  }

  final _$getPatientsWithoutPaginationAsyncAction =
      AsyncAction('_PatientState.getPatientsWithoutPagination');

  @override
  Future<void> getPatientsWithoutPagination() {
    return _$getPatientsWithoutPaginationAsyncAction
        .run(() => super.getPatientsWithoutPagination());
  }

  final _$getPatientsAsyncAction = AsyncAction('_PatientState.getPatients');

  @override
  Future<void> getPatients() {
    return _$getPatientsAsyncAction.run(() => super.getPatients());
  }

  final _$deletePatientsAsyncAction =
      AsyncAction('_PatientState.deletePatients');

  @override
  Future<void> deletePatients(int id) {
    return _$deletePatientsAsyncAction.run(() => super.deletePatients(id));
  }

  @override
  String toString() {
    return '''
patientList: ${patientList},
checkList: ${checkList},
selectedPatientIndex: ${selectedPatientIndex}
    ''';
  }
}
