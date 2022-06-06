import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/helpers/overlay_helper.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/forgot_password/forgot_password.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/pages/forgot_password/slides/done_slide.dart';
import 'package:cursus_app/ui/pages/forgot_password/slides/new_password_slide.dart';
import 'package:cursus_app/ui/pages/forgot_password/slides/otp_code_slide.dart';
import 'package:cursus_app/ui/pages/forgot_password/slides/phone_number_slide.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late PageController pageViewController;
  ForgotPasswordState forgotPasswordState = ForgotPasswordState();
  late ReactionDisposer reactionDisposer;

  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    forgotPasswordState.setupValidations();
    reactionDisposer = autorun((_) {
      final pageState = forgotPasswordState.storeState;
      if (pageState.state == StoreStates.success) {
        if (pageState.successMessage == 'smsSent'.tr()) {
          pageViewController.animateToPage(
            1,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
        if (pageState.successMessage == 'passwordChanged'.tr()) {
          pageViewController.animateToPage(
            3,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      } else if (pageState.state == StoreStates.error) {
        showCustomOverlayNotification(
          color: AppColors.errorRed,
          text: pageState.errorMessage!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                if (_activePage != 3)
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
                              curve: Curves.ease);
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ic_back.svg',
                      ),
                    ),
                  ),
                Column(
                  children: [
                    if (_activePage != 3)
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
                            PhoneNumberSlide(
                              forgotPasswordState: forgotPasswordState,
                              phoneError: forgotPasswordState.errors.phone,
                            ),
                            OtpCodeSlide(
                              forgotPasswordState: forgotPasswordState,
                              pageController: pageViewController,
                            ),
                            NewPasswordSlide(
                              forgotPasswordState: forgotPasswordState,
                              passwordError:
                                  forgotPasswordState.errors.newPassword,
                            ),
                            const DoneSlide(
                              message: 'passwordChanged',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        if (_activePage != 1)
                          MainButton(
                            callback: () {
                              if (_activePage == 0) {
                                forgotPasswordState.sendOtpCode();
                              } else if (_activePage == 2) {
                                forgotPasswordState.changePassword();
                              } else if (_activePage == 3) {
                                AutoRouter.of(context)
                                    .push(AuthorizationRoute());
                              }
                            },
                            label: _activePage == 3
                                ? 'signIn'.tr()
                                : 'keywords.next'.tr(),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
                if (forgotPasswordState.storeState.state == StoreStates.loading)
                  const Loading(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }
}
