import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/ui/widgets/avatar_widget.dart';
import 'package:cursus_app/ui/widgets/bottom_sheet_dialog/dilemma_bottom_sheet.dart';
import 'package:cursus_app/ui/widgets/cursus_icons.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                'assets/illustrations/ill_back.png',
                fit: BoxFit.fitHeight,
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    AvatarWidget(),
                    Divider(
                      height: 30,
                      thickness: 1.5,
                    ),
                    _SectionRow(
                      iconData: CursusIcons.profile,
                      name: 'keywords.personal_data'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(PersonalDataRoute());
                      },
                    ),
                    _SectionRow(
                      iconData: CursusIcons.settings,
                      name: 'keywords.settings'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(SettingsRoute());
                      },
                    ),
                    _SectionRow(
                      iconData: CursusIcons.cart,
                      name: 'keywords.cart'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(CartRoute());
                      },
                    ),
                    Divider(
                      height: 30,
                      thickness: 1.5,
                    ),
                    _SectionRow(
                      iconData: CursusIcons.about_us,
                      name: 'keywords.about_us'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(AboutRoute());
                      },
                    ),
                    _SectionRow(
                      iconData: CursusIcons.privacy,
                      name: 'keywords.privacy'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(PrivacyRoute());
                      },
                    ),
                    _SectionRow(
                      iconData: CursusIcons.help,
                      name: 'keywords.help'.tr(),
                      onPressed: () {
                        AutoRouter.of(context).push(HelpRoute());
                      },
                    ),
                    Divider(
                      height: 30,
                      thickness: 1.5,
                    ),
                    _SectionRow(
                      iconData: Icons.logout,
                      name: 'keywords.sign_out'.tr(),
                      showArrowIcon: false,
                      onPressed: () async {
                        showModalBottomSheet(
                          barrierColor: AppColors.bottomSheetBarrier,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => DilemmaBottomSheet(
                              question: 'exitDialog'.tr(),
                              positiveAnswer: 'keywords.yes'.tr(),
                              negativeAnswer: 'keywords.cancel'.tr(),
                              positiveAnswerCallback: () async {
                                // await StorageHelper.removeAll();
                                await AutoRouter.of(context)
                                    .replace(const AuthorizationRoute());
                              }),
                        );
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionRow extends StatelessWidget {
  final IconData iconData;
  final String name;
  final VoidCallback onPressed;
  final bool showArrowIcon;

  const _SectionRow({
    required this.iconData,
    required this.name,
    required this.onPressed,
    this.showArrowIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.settingsBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 230,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: showArrowIcon,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
