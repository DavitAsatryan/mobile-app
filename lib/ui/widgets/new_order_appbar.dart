import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

import 'appbar_icons/custom_back_button.dart';


class NewOrderAppBar extends StatelessWidget {
  final String title;
  const NewOrderAppBar({required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(
          iconColor: AppColors.white,
          textColor: AppColors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            title,
            style: Styles.boldTextStyle
                .copyWith(color: AppColors.white),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.grey150,
              ),
            )),
      ],
    );
  }
}
