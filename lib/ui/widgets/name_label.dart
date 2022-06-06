import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class NameLabel extends StatelessWidget {
  const NameLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.dashboardTextColor,
          fontSize: 28,
        ),
      ),
    );
  }
}