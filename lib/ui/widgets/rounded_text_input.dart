import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String?>? validateText;
  final bool enabled;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? textInputFormatter;
  final String hintText;
  final TextInputAction? textInputAction;

  const RoundedTextInput({
    required this.inputType,
    required this.obscureText,
    required this.onChanged,
    required this.hintText,
    this.controller,
    this.validateText,
    this.enabled = true,
    this.textDirection,
    this.textInputFormatter,
    this.textInputAction,
  });

  @override
  _RoundedTextInputState createState() => _RoundedTextInputState();
}

class _RoundedTextInputState extends State<RoundedTextInput> {
  bool showObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction?? TextInputAction.done,
      inputFormatters: widget.textInputFormatter,
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.inputType,
      cursorWidth: 2,
      cursorHeight: 18,
      autofocus: false,
      obscureText: widget.obscureText ? showObscureText : false,
      textAlign: TextAlign.start,
      textDirection: widget.textDirection,
      onChanged: widget.onChanged,
      validator: widget.validateText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText.tr(),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.grey350,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showObscureText = !showObscureText;
                  });
                },
                iconSize: 16,
                icon: Icon(
                  showObscureText ? Icons.visibility_off : Icons.visibility,
                ),
                color: Colors.white,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}
