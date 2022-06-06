import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskFormatter = new MaskTextInputFormatter(mask: '(+374)## ###-###', filter: { "#": RegExp(r'[0-9]') });
