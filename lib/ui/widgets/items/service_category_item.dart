import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceCategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const ServiceCategoryItem({required this.title,required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
        const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
            BorderRadius.circular(
                10)),
        margin:
        const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2),
        child: Row(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(
                  left: 4,
                  right: 4,
                  bottom: 2,
                  top: 2),
              child: SizedBox(
                width: 22,
                height: 20,
                child: SvgPicture.asset(
                  'assets/icons/ic_diagnostics.svg',
                ),
              ),
            ),
            Text(title)
          ],
        ));
  }
}
