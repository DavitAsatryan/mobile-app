import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final BorderRadius? borderRadius;
  final Color? fontColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final bool filled;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;

  const SearchBox(
      {required this.hintText,
      this.textEditingController,
      this.onChanged,
      this.borderRadius,
      this.fontColor,
      this.fillColor,
      this.suffixIcon,
      this.borderColor,
      this.hintStyle,
      this.filled=true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColors.greyTextColorOps85.withOpacity(.13), blurRadius: 10, spreadRadius: 5),
            ],
          ),
        ),
        TextField(
          onChanged: onChanged,
          controller: textEditingController,
          style:
              TextStyle(fontSize: 16, color: fontColor ?? AppColors.primaryText2),
          decoration: InputDecoration(
            filled: filled,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: borderRadius ?? BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: borderRadius ?? BorderRadius.circular(10)),
            fillColor: fillColor ?? AppColors.white,
            hintText: hintText,
            hintStyle: hintStyle ?? const TextStyle(fontSize: 16),
            suffixIcon: suffixIcon?? UnconstrainedBox(
                child: SvgPicture.asset('assets/icons/ic_search.svg')),
            // const Icon(
            //   Icons.search,
            // ),
            contentPadding: const EdgeInsets.only(left: 14, bottom: 20, top: 20),
          ),
        ),
      ],
    );
  }
}
