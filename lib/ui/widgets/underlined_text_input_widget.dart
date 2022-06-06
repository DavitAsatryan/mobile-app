import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';


class UnderlinedTextInputWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color color;
  final bool hasBorder;

  const UnderlinedTextInputWidget({
    required this.child,
    Key? key,
    this.padding,
    this.color = white,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        children: [
          child,
          SizedBox(height: 12,),
          Container(height: 1, width: screenWidth(context),color: AppColors.dividerColor.withOpacity(.5))

        ],
      ),
    );
  }
}
