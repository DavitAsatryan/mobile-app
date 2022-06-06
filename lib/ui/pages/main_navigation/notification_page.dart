import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart'
    hide NotificationModel;
import 'package:cursus_app/model/notification_model/notification_model.dart';
import 'package:cursus_app/store/add_patient_state.dart/add_patient_state.dart';
import 'package:cursus_app/store/notification/notification_state.dart';
import 'package:cursus_app/store/patients/patients_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cursus_app/router.gr.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotificationAvailable = true;
  final NotificationState notificationState = NotificationState();
  var dateFormat = DateFormat('dd MMMM yy');
  PatientState patientState = PatientState();

  @override
  void initState() {
    super.initState();
    notificationState.geNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => notificationState.storeState.state ==
                StoreStates.loading
            ? Loading(
                color: Colors.transparent,
              )
            : Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: isNotificationAvailable
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'keywords.notifications'.tr(),
                                style: TextStyle(
                                    color: AppColors.dashboardTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // AwesomeNotifications().createNotification(
                                    //     content: NotificationContent(
                                    //         id: 10,
                                    //         channelKey: 'basic_channel',
                                    //         title: 'Simple Notification',
                                    //         body: 'Simple body'));
                                    notificationState.markAllRead();
                                    notificationState.geNotifications();
                                    for (var notification
                                        in notificationState.notificationList) {
                                      if (notification.acknowledged) {
                                        return;
                                      }
                                      setState(() {
                                        notification = notification.copyWith(
                                            acknowledged: true);
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      'markAllAsRead'.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: AppColors.darkGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            PagedListView<int, NotificationModel>(
                              shrinkWrap: true,
                              pagingController:
                                  notificationState.pagingController,
                              builderDelegate: PagedChildBuilderDelegate<
                                      NotificationModel>(
                                  itemBuilder: (context, item, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          notificationState
                                              .markIDasRead(item.id);
                                          if (item.action == 'NAVIGATE') {
                                            item.resource == "ORDER"
                                                ? AutoRouter.of(context).push(
                                                    OrderDetailsRoute(
                                                        oderID: item.entity!))
                                                : AutoRouter.of(context).push(
                                                    AddNewPatientRoute(
                                                        id: item.entity,
                                                        patientState:
                                                            patientState));
                                          }
                                        },
                                        child: Container(
                                          height: 80,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: !notificationState
                                                      .notificationList[index]
                                                      .acknowledged
                                                  ? Border.all(
                                                      color: AppColors
                                                          .notificationItemColor,
                                                      width: 2)
                                                  : Border.all(
                                                      color:
                                                          AppColors.grey150)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                notificationState
                                                    .notificationList[index]
                                                    .fullText,
                                                style: notificationState
                                                            .notificationList[
                                                                index]
                                                            .acknowledged ==
                                                        false
                                                    ? Styles.boldTextStyle.copyWith(
                                                        color: AppColors
                                                            .notificationItemColor,
                                                        fontSize: 18)
                                                    : Styles.mainTextStyle
                                                        .copyWith(
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 18),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                              SizedBox(
                                                width: 100,
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      '${dateFormat.format(notificationState.notificationList[index].createdAt)}',
                                                      style: !notificationState
                                                              .notificationList[
                                                                  index]
                                                              .acknowledged
                                                          ? Styles.boldTextStyle
                                                              .copyWith(
                                                                  fontSize: 16)
                                                          : Styles
                                                              .semiBoldTextStyle
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  color: AppColors
                                                                      .black
                                                                      .withOpacity(
                                                                          .5)),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            )
                          ])
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You Don\'t have \n any notifications',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.notifications_off_outlined,
                              color: AppColors.darkWhite.withOpacity(.5),
                              size: 120,
                            )
                          ],
                        ),
                      ),
              ));
  }
}

// AwesomeNotifications()
//     .createNotification(
// content: NotificationContent(
// id: 10,
// channelKey: 'basic_channel',
// title:
// 'Simple Notification',
// body: 'Simple body')
