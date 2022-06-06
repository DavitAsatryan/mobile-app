import 'package:cursus_app/model/credit_card/credit_card_model.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {

  final CreditCardModel cardModel;
  const CreditCardWidget({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 15,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.textDarkPurpleColor,
                  AppColors.textPurpleColor,
                  AppColors.purpleLight,
                  AppColors.purpleLight,
                ],
              ),
            ),
            child: Center(
              child: Text(
                'card'.tr(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardModel.cardholderName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              cardModel.maskedNumber,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppColors.greyTextColorOps85,
              ),
            ),
          ],
        ),
      ],
    );
  }
}