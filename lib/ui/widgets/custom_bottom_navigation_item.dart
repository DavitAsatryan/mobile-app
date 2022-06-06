import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int page;
  final int currentPage;
  final Widget icon;
  final String title;

  const CustomBottomNavigationItem(
      {
        required this.icon,
        required this.page,
        required this.currentPage,
        required this.title,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        icon,
        Text(
          title,
          style: TextStyle(
              fontSize: 11,
              fontWeight: page == currentPage ? FontWeight.bold : FontWeight.w500,
              color: page == currentPage ? AppColors.purpleDark : AppColors.black),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
