import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  const GradientContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 0),
          colors: [
            AppColors.purpleLight,
            AppColors.textPurpleColor,
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
