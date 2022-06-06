import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'drop_down_icon.dart';

class DatePickerContainer extends StatelessWidget {
  final String label;
  final String hint;
  final VoidCallback onPressed;
  final String? value;
  final double? padding;

  const DatePickerContainer({
    required this.label,
    required this.hint,
    required this.onPressed,
    this.value,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ).tr(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.grey250,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value != null ? value! : hint,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            value != null ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ).tr(),
                    DropDownIcon(
                      onPressed: () {},
                      isOpend: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
