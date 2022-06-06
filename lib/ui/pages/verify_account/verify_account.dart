import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/store/verify_account/verify_account_store.dart';
import 'package:cursus_app/ui/pages/forgot_password/slides/done_slide.dart';
import 'package:cursus_app/ui/pages/verify_account/verify_otp_code_slide.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

class VerifyAccountPage extends StatefulWidget {
  final String phoneNumber;
  final String? userVerifyToken;

  const VerifyAccountPage({
    required this.phoneNumber,
    this.userVerifyToken,
    Key? key,
  }) : super(key: key);

  @override
  _VerifyAccountPageState createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  late PageController pageViewController;
  late VerifyAccountState verifyAccountState;
  late ReactionDisposer reactionDisposer;

  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();

    // verifyAccountState = VerifyAccountState(
    //   phoneNumber: widget.phoneNumber,
    //   userVerifyToken: widget.userVerifyToken,
    // );
    if (widget.userVerifyToken == null) {
      verifyAccountState.resendVerifyCode(widget.phoneNumber);
    }

    reactionDisposer = autorun((_) {
      final pageState = verifyAccountState.storeState;
      if (pageState.state == StoreStates.success) {
        if (pageState.successMessage == 'verifiedAccount'.tr()) {
          pageViewController.jumpToPage(1);
        }
      } else if (verifyAccountState.storeState.state == StoreStates.error) {
        showCustomOverlayNotification(
          color: AppColors.errorRed,
          text: verifyAccountState.storeState.errorMessage!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/illustrations/ill_back.png',
                    fit: BoxFit.cover,
                  ),
                ),
                if (_activePage == 0)
                  Positioned(
                    top: 60,
                    left: 34,
                    width: 25,
                    height: 25,
                    child: GestureDetector(
                      onTap: () async {
                        if (pageViewController.page == 0) {
                          await AutoRouter.of(context).pop();
                        } else {
                          await pageViewController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ic_back.svg',
                      ),
                    ),
                  ),
                Column(
                  children: [
                    if (_activePage == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SvgPicture.asset(
                          'assets/icons/logo_with_text.svg',
                          width: screenHeight(context) * .2,
                        ),
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    Flexible(
                      child: Center(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageViewController,
                          onPageChanged: (page) => setState(() {
                            _activePage = page;
                          }),
                          children: [
                            VerifyOtpCodeSlide(
                              phoneNumber: widget.phoneNumber,
                              userVerifyToken: widget.userVerifyToken!,
                            ),
                            const DoneSlide(
                              message: 'Your account is now verified',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        if (_activePage != 0)
                          MainButton(
                            callback: () {
                              AutoRouter.of(context).pop();
                            },
                            label: 'Sign In',
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
                if (verifyAccountState.storeState.state == StoreStates.loading)
                  const Loading(),
              ],
            );
          },
        ),
      ),
    );
  }
}
