import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      size: 25,
      color: AppColors.dashboardTextColor,
    );
  }
}