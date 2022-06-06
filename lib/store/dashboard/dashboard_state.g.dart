// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardState on _DashboardState, Store {
  Computed<UserModel>? _$currentUserComputed;

  @override
  UserModel get currentUser =>
      (_$currentUserComputed ??= Computed<UserModel>(() => super.currentUser,
              name: '_DashboardState.currentUser'))
          .value;

  final _$selectedLanguageAtom = Atom(name: '_DashboardState.selectedLanguage');

  @override
  String? get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String? value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  final _$userHasTokenAtom = Atom(name: '_DashboardState.userHasToken');

  @override
  bool get userHasToken {
    _$userHasTokenAtom.reportRead();
    return super.userHasToken;
  }

  @override
  set userHasToken(bool value) {
    _$userHasTokenAtom.reportWrite(value, super.userHasToken, () {
      super.userHasToken = value;
    });
  }

  final _$aboutUsModelAtom = Atom(name: '_DashboardState.aboutUsModel');

  @override
  AboutUsModel? get aboutUsModel {
    _$aboutUsModelAtom.reportRead();
    return super.aboutUsModel;
  }

  @override
  set aboutUsModel(AboutUsModel? value) {
    _$aboutUsModelAtom.reportWrite(value, super.aboutUsModel, () {
      super.aboutUsModel = value;
    });
  }

  final _$coordinatesAtom = Atom(name: '_DashboardState.coordinates');

  @override
  LatLng? get coordinates {
    _$coordinatesAtom.reportRead();
    return super.coordinates;
  }

  @override
  set coordinates(LatLng? value) {
    _$coordinatesAtom.reportWrite(value, super.coordinates, () {
      super.coordinates = value;
    });
  }

  final _$helpResponseListAtom = Atom(name: '_DashboardState.helpResponseList');

  @override
  ObservableList<HelpResponseModel> get helpResponseList {
    _$helpResponseListAtom.reportRead();
    return super.helpResponseList;
  }

  @override
  set helpResponseList(ObservableList<HelpResponseModel> value) {
    _$helpResponseListAtom.reportWrite(value, super.helpResponseList, () {
      super.helpResponseList = value;
    });
  }

  final _$refreshTokenPeriodicallyAsyncAction =
      AsyncAction('_DashboardState.refreshTokenPeriodically');

  @override
  Future<void> refreshTokenPeriodically() {
    return _$refreshTokenPeriodicallyAsyncAction
        .run(() => super.refreshTokenPeriodically());
  }

  final _$refreshTokenAsyncAction = AsyncAction('_DashboardState.refreshToken');

  @override
  Future<void> refreshToken() {
    return _$refreshTokenAsyncAction.run(() => super.refreshToken());
  }

  final _$getAboutUsAsyncAction = AsyncAction('_DashboardState.getAboutUs');

  @override
  Future<void> getAboutUs() {
    return _$getAboutUsAsyncAction.run(() => super.getAboutUs());
  }

  final _$sendMessageAsyncAction = AsyncAction('_DashboardState.sendMessage');

  @override
  Future<void> sendMessage(BuildContext context, String name, String phone,
      String email, String message) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(context, name, phone, email, message));
  }

  final _$getHelpQuestionsAsyncAction =
      AsyncAction('_DashboardState.getHelpQuestions');

  @override
  Future<void> getHelpQuestions() {
    return _$getHelpQuestionsAsyncAction.run(() => super.getHelpQuestions());
  }

  @override
  String toString() {
    return '''
selectedLanguage: ${selectedLanguage},
userHasToken: ${userHasToken},
aboutUsModel: ${aboutUsModel},
coordinates: ${coordinates},
helpResponseList: ${helpResponseList},
currentUser: ${currentUser}
    ''';
  }
}
