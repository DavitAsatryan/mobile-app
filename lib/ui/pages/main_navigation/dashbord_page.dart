
import 'package:cursus_app/store/notification/notification_state.dart';
import 'package:cursus_app/store/personal_data_state/personal_data_state.dart';
import 'package:cursus_app/ui/pages/main_navigation/account_page.dart';
import 'package:cursus_app/ui/pages/main_navigation/home_page.dart';
import 'package:cursus_app/ui/pages/main_navigation/notification_page.dart';
import 'package:cursus_app/ui/pages/main_navigation/orders_page.dart';
import 'package:cursus_app/ui/pages/order/new_order_page.dart';
import 'package:cursus_app/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../store/dashboard/dashboard_state.dart';
import '../../../values/values.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardState = GetIt.I<DashboardState>();
  PersonalDataState personalDataState = PersonalDataState();
  NotificationState notificationState = NotificationState();

  int _page = 0;

  final controller = PageController();

  @override
  void initState() {
    super.initState();
    //initializeFirebaseService();
    // AwesomeNotifications()
    //     .actionStream
    //     .listen((ReceivedNotification receivedNotification) async {
    //   print('eeekkkkkkkkeeeee');
    //
    //   await AutoRouter.of(context).replace(const DashboardRoute());
    // });
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
                child: Container(
              color: AppColors.lightGrey,
            )),
            Positioned.fill(
                child: Image.asset(
              'assets/illustrations/ill_back.png',
              fit: BoxFit.fitHeight,
            )),
            Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              extendBody: true,
              body: SafeArea(
                child: dashboardState.loadingState.loading
                    ? const Loading(
                        color: Colors.transparent,
                      )
                    : PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (page) {
                          setState(() {
                            _page = page;
                          });
                        },
                        controller: controller,
                        children: const [
                          HomePage(),
                          OrdersPage(),
                          NotificationPage(),
                          AccountPage(),
                        ],
                      ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(.1),
                    spreadRadius: 2,
                    blurRadius: 20,
                  ),
                ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: 85,
                    child: BottomAppBar(
                      elevation: 5,
                      notchMargin: 13,
                      color: AppColors.white,
                      shape: const CircularNotchedRectangle(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _page = 0;
                                        });
                                        controller.jumpToPage(_page);
                                      },
                                      child: CustomBottomNavigationItem(
                                          title: 'keywords.home'.tr(),
                                          currentPage: _page,
                                          page: 0,
                                          icon: SvgPicture.asset(
                                            _page == 0
                                                ? 'assets/icons/ic_home_bold.svg'
                                                : 'assets/icons/ic_home.svg',
                                            width: 25,
                                            height: 25,
                                          ))),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _page = 1;
                                        });
                                        controller.jumpToPage(_page);
                                      },
                                      child: CustomBottomNavigationItem(
                                          currentPage: _page,
                                          page: 1,
                                          title: 'orders'.tr(),
                                          icon: SvgPicture.asset(
                                            _page == 1
                                                ? 'assets/icons/ic_calendar_bold.svg'
                                                : 'assets/icons/ic_calendar.svg',
                                            width: 25,
                                            height: 25,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 10,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              // margin: const EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _page = 2;
                                      });
                                      controller.jumpToPage(_page);
                                    },
                                    child: CustomBottomNavigationItem(
                                        title: 'keywords.notifications'.tr(),
                                        currentPage: _page,
                                        page: 2,
                                        icon: SvgPicture.asset(
                                          _page == 2
                                              ? 'assets/icons/ic_notifications_bold.svg'
                                              : 'assets/icons/ic_notifications.svg',
                                          width: 25,
                                          height: 25,
                                        )),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _page = 3;
                                        setState(() {});
                                        controller.jumpToPage(_page);
                                      },
                                      child: CustomBottomNavigationItem(
                                          title: 'keywords.account'.tr(),
                                          currentPage: _page,
                                          page: 3,
                                          icon: SvgPicture.asset(
                                            _page == 3
                                                ? 'assets/icons/ic_account_bold.svg'
                                                : 'assets/icons/ic_account.svg',
                                            width: 25,
                                            height: 25,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      barrierColor: AppColors.bottomSheetBarrier,
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const NewOrderPage(),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment(.2, -.5),
                          colors: [
                            AppColors.purpleDark,
                            AppColors.purpleDark,
                            AppColors.purpleLight
                          ]),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          'assets/icons/ic_all_services.svg',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getInfo() async {
    await dashboardState.refreshTokenPeriodically();
    // await dashboardState.refreshToken();
    // String? deviceId = await getDeviceId();
    // notificationState.sendFCM(_firebaseAppToken, deviceId!);

    personalDataState.getUser();
    await dashboardState.getAboutUs();
  }
}
