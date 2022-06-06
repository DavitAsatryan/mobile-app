import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../values/values.dart';

class DoneSlide extends StatelessWidget {
  final String message;
  const DoneSlide({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          message.tr(),
          style: Styles.semiBoldTextStyle,
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/icons/ic_check.svg',
          width: 120,
          height: 120,
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
