import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';


class RoundedCornerShadowContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final Color color;
  final bool hasBorder;

  const RoundedCornerShadowContainer(
      {Key? key,
      this.child,
      this.padding,
      this.color = white,
      this.hasBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
            color:
                hasBorder ? primaryColor.withOpacity(.1) : Colors.transparent),
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(.1),
            offset: const Offset(0, 10),
            blurRadius: 10,
          )
        ],
      ),
      child: child,
    );
  }
}
