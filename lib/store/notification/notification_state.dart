import 'package:cursus_app/data/repository/notification_repository.dart';
import 'package:cursus_app/model/notification_model/notification_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'notification_state.g.dart';

class NotificationState = _NotificationState with _$NotificationState;

abstract class _NotificationState with Store {
  final StoreState storeState = StoreState();
  final NotificationRepository notificationRepository =
      NotificationRepository();

  PagingController<int, NotificationModel> pagingController =
      PagingController<int, NotificationModel>(firstPageKey: 0);

  @observable
  ObservableList<NotificationModel> notificationList =
      <NotificationModel>[].asObservable();

  int currentOffset = 0;
  static const fetchLimit = 20;

  @observable
  var painList = ObservableList<dynamic>();

  @observable
  bool isSearching = false;

  @action
  Future<void> geNotifications() async {
    try {
      storeState.changeState(StoreStates.loading);
      List<NotificationModel> notifications =
          await notificationRepository.getNotifications(
        offset: currentOffset,
        limit: fetchLimit,
      );
      final isLastPage = notifications.length < fetchLimit;
      if (isLastPage) {
        pagingController.appendLastPage(notifications);
      } else {
        currentOffset += notifications.length;
        pagingController.appendPage(notifications, currentOffset);
      }
      if (notifications.isEmpty) {
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
  Future<void> markIDasRead(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      notificationRepository.markAsRead(id);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> sendFCM(String FCM, String deviceId) async {
    try {
      storeState.changeState(StoreStates.loading);
      notificationRepository.sendFCM(FCM, deviceId);
    //  storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> markAllRead() async {
    try {
      storeState.changeState(StoreStates.loading);
      notificationRepository.markAllAsRead();
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }
}
