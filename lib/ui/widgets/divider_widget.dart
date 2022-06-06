import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final bool hasPadding;
  const DividerWidget({
    Key? key,
    this.hasPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: hasPadding ? 8 : 0),
      child: const Divider(
        height: 1,
        endIndent: 40,
        indent: 40,
        color: AppColors.grey150,
      ),
    );
  }
}
