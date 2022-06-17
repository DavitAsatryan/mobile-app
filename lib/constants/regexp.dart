import 'package:intl/intl.dart';

// Add . passwordRegex
const passwordRegexp =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[%?!@#\$&*~]).{8,}$';
const urlRegexp = r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
const phoneNumberRegexp = r'[+0]\d+[\d-]+\d';
const emailRegExp =
    r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+";
final formatCurrency = new NumberFormat.simpleCurrency(name: '');
//r'[A-Z,a-z,0-9(]{6}';
//r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[%?!@#\$&*~]).{8}$';
//r'^?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'