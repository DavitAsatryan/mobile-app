import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback? callback;
  final EdgeInsets? padding;

  const MainButton({
    Key? key,
    required this.label,
    this.callback,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: padding ?? EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth(context),
      decoration: BoxDecoration(
        gradient: callback == null
            ? null
            : const LinearGradient(colors: [
                AppColors.purpleDark,
                AppColors.purpleDark,
                AppColors.purpleLight
              ]),
        borderRadius: AppRadius.primaryRadius,
      ),
      child: ClipRRect(
        borderRadius: AppRadius.primaryRadius,
        child: ElevatedButton(
          onPressed: () => callback != null ? callback!() : null,
          style: callback == null
              ? null
              : ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                ),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
      ),
    );
  }
}
