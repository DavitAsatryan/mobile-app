import 'package:flutter/material.dart';

import '../../constants/theme/app_theme.dart';
import '../../values/values.dart';


class SelectorItem extends StatelessWidget {
  final String menuText;
  final IconData leadingIcon;

  const SelectorItem(this.menuText, this.leadingIcon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          menuText,
          style: Styles.mainTextStyle,
        ),
        trailing: const Icon(Icons.navigate_next),
        leading: Icon(
          leadingIcon,
          color: warmGrey,
        ),
      );
}
