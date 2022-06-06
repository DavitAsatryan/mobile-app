import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_dialog/add_to_card_bottom_sheet.dart';

class ItemServiceSearch extends StatelessWidget {
  final ServiceModel serviceModel;

  const ItemServiceSearch({
    required this.serviceModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            barrierColor: AppColors.bottomSheetBarrier,
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddToCardBottomSheet(
              serviceName: '${serviceModel.name}  ',
              price: serviceModel.price!,
              id: serviceModel.id,
              icon: serviceModel.icon,
              isBundle: false,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      serviceModel.name,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${serviceModel.price}  \֏',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (serviceModel.description != null &&
                      serviceModel.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Tooltip(
                        message: serviceModel.description!,
                        child: Icon(
                          Icons.info_outline_rounded,
                          color: AppColors.textPurpleColor,
                        ),
                      ),
                    ),
                  Icon(
                    Icons.add,
                  )
                ],
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.primaryText1.withOpacity(.5),
              )
            ],
          ),
        ));
  }
}
