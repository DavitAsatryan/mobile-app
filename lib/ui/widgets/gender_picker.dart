import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String?> onChanged;
  const GenderPicker({
    required this.selectedGender,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  static String? genderValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hints.gender'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: GenderContainer(
                  value: 'hints.male'.tr(),
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GenderContainer(
                  value: 'hints.female'.tr(),
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GenderContainer extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?>? onChanged;
  const GenderContainer({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: AppColors.grey100,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          children: [
            Radio(
              onChanged: onChanged,
              value: value.trim().toLowerCase(),
              groupValue: groupValue.trim().toLowerCase(),
              activeColor: AppColors.purpleDark,
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
