import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final bool hasSuffix;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? errorText;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? padding;
  final TextInputType keyboardType;
  final int? minLines;
  final int? maxLines;
  final Color? textColor;
  final Color? hintColor;

  const TextInput({
    required this.hintText,
    Key? key,
    this.focusNode,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.textInputAction,
    this.errorText,
    this.hasSuffix = false,
    this.inputFormatters,
    this.padding,
    this.minLines,
    this.maxLines, this.textColor, this.hintColor,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.hasSuffix;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        style: TextStyle(
          color: widget.textColor ?? AppColors.darkBlackColor,
        ),
       // scrollPadding: EdgeInsets.symmetric(vertical: 2),
        obscureText: isObscure,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.purpleDark,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.shadowColor,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.purpleDark,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.shadowColor,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.purpleDark,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              // width: 1.5,
              color: AppColors.purpleDark,
            ),
          ),
          hintMaxLines: 1,
          hintStyle: TextStyle(
            color: widget.hintColor ?? AppColors.textColor.withOpacity(.85),
            fontSize: 14,
            //  fontWeight: FontWeight.w600,
            height: 2,
          ),
          errorText: widget.errorText,
          errorMaxLines: 2,
          errorStyle: const TextStyle(
            fontSize: 11,
            height: 1.2,
            color: AppColors.errorRed,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.hasSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;

                    });
                  },
                  iconSize: 16,
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  color: AppColors.textDarkPurpleColor,
                )
              : null,
        ),
        controller: widget.controller,
      ),
    );
  }
}
