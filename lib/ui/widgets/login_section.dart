import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/constants/enum/support_state.dart';
import 'package:cursus_app/helpers/storage_helper.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide TextInput;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

import '../../formatters.dart';
import '../../router.gr.dart';
import '../../store/authorization/authorization_state.dart';
import '../../values/values.dart';
import 'text_input.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({
    required this.authorizationState,
    Key? key,
  }) : super(key: key);

  final AuthorizationState authorizationState;

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final LocalAuthentication auth = LocalAuthentication();

  SupportState _supportState = SupportState.unknown;

  bool? _canCheckBiometrics;

  String _authorized = 'Not Authorized';

  bool _isAuthenticating = false;
  List<BiometricType>? availableBiometrics = [];
  bool isAgreedToUseBiometrics = false;
  String? refreshKey;

  @override
  void initState() {
    super.initState();
    _getAvailableBiometrics();
    _checkBiometrics();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState =
              isSupported ? SupportState.supported : SupportState.unsupported),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'signIn'.tr(),
            style: Styles.boldTextStyle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Observer(
              builder: (_) => TextInput(
                number: true,
                onChanged: (value) =>
                    widget.authorizationState.phoneNumberLogin = value,
                textInputAction: TextInputAction.next,
                inputFormatters: [maskFormatter],
                hintText: 'hints.phoneNumber'.tr(),
                errorText: widget.authorizationState.errors.phoneNumberLogin,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) => TextInput(
                onChanged: (value) =>
                    widget.authorizationState.passwordLogin = value,
                errorText: widget.authorizationState.errors.passwordLogin,
                hintText: 'hints.password'.tr(),
                hasSuffix: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () async =>
                  AutoRouter.of(context).push(const ForgotPasswordRoute()),
              child: Text(
                'keywords.forgotYourPassword'.tr(),
                style: TextStyle(
                  color: AppColors.greyTextColorOps85,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        if (availableBiometrics != null &&
            isAgreedToUseBiometrics &&
            refreshKey != null)
          GestureDetector(
            onTap: () => _authenticateWithBiometrics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                availableBiometrics!.contains(BiometricType.face)
                    ? SvgPicture.asset(
                        'assets/icons/faceId.svg',
                        width: 40,
                        height: 40,
                        color: AppColors.purpleDark,
                      )
                    : SvgPicture.asset(
                        'assets/icons/fingerprint.svg',
                        width: 40,
                        height: 40,
                        color: AppColors.purpleDark,
                      ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'useBiometricsToLogin'.tr(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: AppColors.purpleDark,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    isAgreedToUseBiometrics = await StorageHelper.getBiometrics();
    String? refresh = await StorageHelper.getRefreshKey();
    if (refresh.isNotEmpty) {
      refreshKey = refresh;
    }

    List<BiometricType> availableBios = await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBios.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBios.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
      availableBiometrics!.addAll(availableBios);
    }
    //todo check alternative option
    // late List<BiometricType> availableBiometrics;
    // try {
    //   availableBiometrics = await auth.getAvailableBiometrics();
    // } on PlatformException catch (e) {
    //   availableBiometrics = <BiometricType>[];
    //   print(e);
    // }
    // if (!mounted) return;

    setState(() {
      //  availableBiometrics = availableBiometrics;
      print('_availableBiometrics    ${availableBiometrics!.length}');
    });
  }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //         localizedReason: 'Let OS determine authentication method',
  //         useErrorDialogs: true,
  //         stickyAuth: true);
  //
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = "Error - ${e.message}";
  //     });
  //     return;
  //   }
  //   if (!mounted) return;
  //
  //   setState(
  //       () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
      if (authenticated) {
        await AutoRouter.of(context).push(DashboardRoute());
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

// void _cancelAuthentication() async {
//   await auth.stopAuthentication();
//   setState(() => _isAuthenticating = false);
// }
}
