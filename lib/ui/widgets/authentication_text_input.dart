import 'dart:ui';

import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';


class AuthenticationTextInputWidget extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool hasVisibleTrailingIcon;
  final VoidCallback? onTap;
  final Function(String value)? onChanged;
  const AuthenticationTextInputWidget({
    Key? key,
    this.hintText,
    this.icon,
    this.controller,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.hasVisibleTrailingIcon = false,
    this.onTap,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  //note you can change the anchor by custom widget https://stackoverflow.com/questions/53991915/flutter-enableinteractiveselection-not-working-for-editabletext
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          scrollPadding: const EdgeInsets.only(bottom: 120),
          onChanged: (value) => onChanged!(value),
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          obscureText: obscureText,
          style: const TextStyle(fontSize: 16, color: primaryColor),
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.only(
            //   top: 24,
            // ),
            errorText: errorText,
            // errorStyle: const TextStyle(height: .8, fontSize: 12),
            errorMaxLines: 1,
            isDense: true,
            isCollapsed: true,
            helperText: ' ',
            suffix: hasVisibleTrailingIcon
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTap,
                    child: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      size: 16,
                      color: accentColor,
                    ),
                  )
                : nil,
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: primaryColor,
            ),
            hintText: hintText,
          ),
        ));
  }
}
