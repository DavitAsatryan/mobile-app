import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../helpers/screen_size_accessor.dart';
import '../../../store/authorization/authorization_state.dart';
import '../../../store/dashboard/dashboard_state.dart';
import '../../../values/values.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/loading.dart';
import '../../widgets/login_section.dart';
import '../../widgets/signup_section.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  DashboardState dashboardState = GetIt.I<DashboardState>();
  AuthorizationState authorizationState = AuthorizationState();
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    authorizationState.setupValidations();

    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            child: Stack(
              children: [
                Image.asset(
                  'assets/illustrations/ill_back.png',
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: screenHeight(context) * .07),
                      child: SvgPicture.asset('assets/icons/logo_with_text.svg',
                          width: screenHeight(context) * .15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        children: [
                          LoginSection(
                            authorizationState: authorizationState,
                          ),
                          SignUpSection(
                            authorizationState: authorizationState,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        MainButton(
                          keyPage:
                              _controller.hasClients && _controller.page != 0
                                  ? 1
                                  : null,
                          controller:
                              _controller.hasClients && _controller.page == 0
                                  ? _controller.page
                                  : null,
                          callback: _controller.hasClients &&
                                  _controller.page == 0
                              ? !authorizationState.errors.loginHasErrors &&
                                      authorizationState
                                          .passwordLogin.isNotEmpty
                                  ? authorize
                                  : null
                              : !authorizationState
                                          .errors.registerationHasErrors &&
                                      authorizationState.password.isNotEmpty &&
                                      authorizationState.firstName.isNotEmpty &&
                                      authorizationState.gender.isNotEmpty &&
                                      authorizationState
                                          .agreedToTermsAndConditions &&
                                      authorizationState.agreedToSmsNotification
                                  ? authorize
                                  //note null
                                  : null,
                          label: _controller.hasClients
                              ? _controller.page == 0
                                  ? 'signIn'.tr()
                                  : 'signUp'.tr()
                              : '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () {
                              if (_controller.page == 0) {}
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: _controller.hasClients
                                      ? _controller.page == 0
                                          ? 'dontHaveAnAccount'.tr()
                                          : 'haveAnAccount'.tr()
                                      : '',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.textColorOps85,
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: _controller.hasClients
                                            ? _controller.page == 0
                                                ? ' ${'signUp'.tr()}'
                                                : ' ${'signIn'.tr()}'
                                            : '',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w700,
                                            //fontWeight: FontWeight.w600,
                                            color: AppColors.textColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = animateToCurrentPage),
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'orConnectWith'.tr(),
                          style: const TextStyle(color: AppColors.textColor),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                if (authorizationState.storeState.state == StoreStates.loading)
                  const Loading()
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    authorizationState.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> authorize() async {
    if (_controller.page == 0) {
      await authorizationState.logIn(context);
    } else {
      await authorizationState.register(context);
    }
  }

  void animateToCurrentPage() {
    _controller.page == 0
        ? _controller.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn)
        : _controller.previousPage(
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
