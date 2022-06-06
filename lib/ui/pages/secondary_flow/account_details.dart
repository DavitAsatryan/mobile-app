import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../helpers/screen_size_accessor.dart';
import '../../widgets/dialogs/change_password_dialog.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({
    Key? key,
  }) : super(key: key);

  final dashboardState = GetIt.I<DashboardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            SvgPicture.asset('assets/icons/ic_hero.svg',
                height: screenHeight(context) * .15,
                width: screenHeight(context) * .15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Card(
                color: brightBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Center(
                          child: Text(
                            'Account details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: textBlueColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Membership Expiration Date',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textBlueColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Observer(
                          builder: (_) => Text(
                            'dashboardState',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: textBlueColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                useRootNavigator: false,
                                builder: (context) => ChangePasswordDialog());
                          },
                          child: Row(
                            children: const [
                              Text(
                                'Change password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: textBlueColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.directions,
                                color: orangeColor,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
