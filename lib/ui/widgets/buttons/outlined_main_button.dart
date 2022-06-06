import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class OutlinedMainButton extends StatelessWidget {
  final String label;
  final VoidCallback? callback;
  final EdgeInsets? padding;

  const OutlinedMainButton({
    Key? key,
    required this.label,
    this.callback,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: padding ?? EdgeInsets.symmetric(horizontal: 30),
      width: screenWidth(context),

      child: ClipRRect(
        borderRadius: AppRadius.primaryRadius,
        child: OutlinedButton(
          onPressed: callback,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            side: BorderSide(width: 1, color: AppColors.textDarkPurpleColor),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textDarkPurpleColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

