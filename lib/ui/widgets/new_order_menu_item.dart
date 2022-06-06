import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewOrderMenuItem extends StatelessWidget {
  final String asset;
  final String menuText;

  const NewOrderMenuItem({
    required this.asset,
    required this.menuText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
        ),
        Center(
          child: SvgPicture.asset(
            'assets/illustrations/ill_menu_item_background_white.svg',
            height: 110,
            color: AppColors.white,
          ),
        ),
        Positioned(
            top: 25,
            left: 0,
            right: 5,
            child: SvgPicture.asset(
              asset,
              width: 55,
              height: 55,
            )),
        Positioned(
          top: 120,
          bottom: 0,
          right: 10,
          left: 0,
          child: Text(
            menuText,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: 16, color: AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
