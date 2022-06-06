import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String?> onChanged;
  const GenderPicker({
    required this.selectedGender,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
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
                child: _GenderContainer(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: _GenderContainer(
                  value: 'Female',
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

class _GenderContainer extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String?>? onChanged;
  const _GenderContainer({
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
        padding: const EdgeInsets.only(right: 10),
        child: RadioListTile(
          onChanged: onChanged,
          value: value.trim().toLowerCase(),
          groupValue: groupValue.trim().toLowerCase(),
          activeColor: AppColors.purpleDark,
          title: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
