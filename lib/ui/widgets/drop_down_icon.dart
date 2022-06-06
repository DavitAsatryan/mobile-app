import 'dart:math';
import 'package:flutter/material.dart';

class DropDownIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isOpend;
  final double size;

  const DropDownIcon({
    required this.onPressed,
    required this.isOpend,
    this.size = 16,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Transform.rotate(
            angle: isOpend ? pi / 2 : -pi / 2,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
