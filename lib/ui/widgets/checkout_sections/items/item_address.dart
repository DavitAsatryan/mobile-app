import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/address/address_model.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ItemAddress extends StatelessWidget {
  final AddressModel addressModel;

  const ItemAddress({
    required this.addressModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'billingAddress'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: AppColors.greyTextColorOps85,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            width: screenWidth(context) * .5,
            child: Text(
              addressModel.address!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}