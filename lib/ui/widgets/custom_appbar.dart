import 'package:cursus_app/ui/widgets/appbar_icons/custom_back_button.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool showBackButton;
  final Widget? trailingIcon;
  final Color textAndIconColor;
  final EdgeInsets? padding;
  final double? titleSize;
  final double? toolBarHeight;
  final String? title;
  final VoidCallback? callback;

  CustomAppBar({
    this.title,
    this.showBackButton = true,
    this.trailingIcon,
    this.textAndIconColor = AppColors.dashboardTextColor,
    this.titleSize,
    this.padding,
    this.toolBarHeight = 30,
    this.callback,
  }) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 20, right: 40),
      child: AppBar(
        toolbarHeight: toolBarHeight,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textAndIconColor,
                  fontSize: titleSize,
                ),
              ).tr()
            : null,
        centerTitle: true,
        //leadingWidth: 110,
        leading: showBackButton
            ? CustomBackButton(
                callback: () {
                  if (callback != null) {
                    callback!();
                  }
                },
                iconColor: textAndIconColor,
                textColor: textAndIconColor,
              )
            : null,
        actions: trailingIcon != null ? [trailingIcon!] : null,
      ),
    );
  }
}
