import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class AddTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const AddTextButton({
    required this.name,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: AppColors.purpleDots,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: AppColors.purpleDots,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
