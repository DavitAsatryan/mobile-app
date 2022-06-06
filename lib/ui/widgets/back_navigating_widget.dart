import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackNavigatingWidget extends StatelessWidget {
  final double? height;
  const BackNavigatingWidget({
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AutoRouter.of(context).pop,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, bottom: 20),
        child: SvgPicture.asset(
          'assets/icons/ic_back.svg',
          height: height ?? 50,
        ),
      ),
    );
  }
}
