import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

import '../../helpers/screen_size_accessor.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          color: color ?? AppColors.textColorOps85.withOpacity(0.8),
          height: screenHeight(context),
          width: double.infinity,
          child: const Center(
            child: SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.purpleDark),
              ),
            ),
          ),
        ),
      );
}
