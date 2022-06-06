import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';


class AuthenticationButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const AuthenticationButton({
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return accentColor; // Disabled color
            }
            return accentColor; // Regular color
          }),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 42),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 25,
            ),
          ),
        ));
  }
}
