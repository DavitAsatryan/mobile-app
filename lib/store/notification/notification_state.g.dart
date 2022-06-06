// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationState on _NotificationState, Store {
  final _$notificationListAtom =
      Atom(name: '_NotificationState.notificationList');

  @override
  ObservableList<NotificationModel> get notificationList {
    _$notificationListAtom.reportRead();
    return super.notificationList;
  }

  @override
  set notificationList(ObservableList<NotificationModel> value) {
    _$notificationListAtom.reportWrite(value, super.notificationList, () {
      super.notificationList = value;
    });
  }

  final _$painListAtom = Atom(name: '_NotificationState.painList');

  @override
  ObservableList<dynamic> get painList {
    _$painListAtom.reportRead();
    return super.painList;
  }

  @override
  set painList(ObservableList<dynamic> value) {
    _$painListAtom.reportWrite(value, super.painList, () {
      super.painList = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_NotificationState.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$geNotificationsAsyncAction =
      AsyncAction('_NotificationState.geNotifications');

  @override
  Future<void> geNotifications() {
    return _$geNotificationsAsyncAction.run(() => super.geNotifications());
  }

  final _$markIDasReadAsyncAction =
      AsyncAction('_NotificationState.markIDasRead');

  @override
  Future<void> markIDasRead(int id) {
    return _$markIDasReadAsyncAction.run(() => super.markIDasRead(id));
  }

  final _$sendFCMAsyncAction = AsyncAction('_NotificationState.sendFCM');

  @override
  Future<void> sendFCM(String FCM, String deviceId) {
    return _$sendFCMAsyncAction.run(() => super.sendFCM(FCM, deviceId));
  }

  final _$markAllReadAsyncAction =
      AsyncAction('_NotificationState.markAllRead');

  @override
  Future<void> markAllRead() {
    return _$markAllReadAsyncAction.run(() => super.markAllRead());
  }

  @override
  String toString() {
    return '''
notificationList: ${notificationList},
painList: ${painList},
isSearching: ${isSearching}
    ''';
  }
}
