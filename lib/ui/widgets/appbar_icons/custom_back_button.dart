import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../cursus_icons.dart';

class CustomBackButton extends StatelessWidget {
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback? callback;
  const CustomBackButton({
    this.iconColor,
    this.textColor,
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback!();
        }
        AutoRouter.of(context).pop();
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        child: Row(
          children: [
            Icon(
              CursusIcons.back,
              color: iconColor ?? Colors.black,
              size: 10,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'keywords.back'.tr(),
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: textColor ?? AppColors.black,
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
