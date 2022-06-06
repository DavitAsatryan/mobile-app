import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PromoteSubscriptionDialog extends StatelessWidget {
  const PromoteSubscriptionDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: textBlueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: screenHeight(context) * .7,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 15,
              top: -30,
              child: Column(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset(
                      'assets/icons/ic_navigate.svg',
                      color: orangeColor,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Browse\n deals\n before\nyou buy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.1,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 11),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/icons/ic_girl_white.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Become Local and Loyal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign up today',
                  style: TextStyle(
                      color: orangeColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Only £20 for 12 months membership giving access to all these deals and saving you hundreds of pounds shopping locally.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.8,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                //   color: white,
                //   child: GestureDetector(
                //     onTap: () async =>
                //          AutoRouter.of(context).push(const SignUpRoute()),
                //     child: SvgPicture.asset(
                //       'assets/icons/ic_btn_signup.svg',
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
