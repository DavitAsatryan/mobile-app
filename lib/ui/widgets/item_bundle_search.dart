
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';

class ItemBundleSearch extends StatelessWidget {
  final BundleModel bundleModel;

  const ItemBundleSearch({
    required this.bundleModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    bundleModel.name,
                    style: TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${bundleModel.price}\֏',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
              )
            ],
          ),
          Divider(
            height: 1,
            thickness: 1.5,
            color: AppColors.dividerColor.withOpacity(.4),
          )
        ],
      ),
    );
  }
}
