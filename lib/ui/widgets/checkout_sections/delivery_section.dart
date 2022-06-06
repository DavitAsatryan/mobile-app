import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/address/address_state.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/add_new_action_widget.dart';
import 'package:cursus_app/ui/widgets/checkout_sections/items/item_address.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:get_it/get_it.dart';

import '../drop_down_icon.dart';

class DeliverySection extends StatefulWidget {
  final AddressState addressState;

  const DeliverySection({
    Key? key,
    required this.addressState,
  }) : super(key: key);

  @override
  State<DeliverySection> createState() => _DeliverySectionState();
}

class _DeliverySectionState extends State<DeliverySection> {
  bool isOpend = false;
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: !isOpend
          ? Observer(
        builder: (_) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'deliveryLocation'.tr(),
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColors.textDarkPurpleColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.addressState.addressList.isEmpty
                          ? GestureDetector(
                        onTap: () =>
                            AutoRouter.of(context)
                                .push(
                              AddNewAddressRoute(
                                  addressState: widget.addressState),
                            )
                                .then((value) =>
                                widget.addressState.getAddresses()),
                        child: AddNewActionWidget(
                          itemName: 'addNewAddress'.tr(),
                        ),
                      )
                          : ItemAddress(
                        addressModel:
                        widget.addressState.defaultAddress,
                      ),
                      DropDownIcon(
                        onPressed: () {
                          isOpend = !isOpend;
                          setState(() {});
                        },
                        isOpend: isOpend,
                      ),
                    ],
                  ),
                ],
              ),
            ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          elevation: 2,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'deliveryLocations'.tr(),
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.textDarkPurpleColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      DropDownIcon(
                        onPressed: () {
                          isOpend = !isOpend;
                          setState(() {});
                        },
                        isOpend: isOpend,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widget.addressState.addressList.length <= 3
                        ? widget.addressState.addressList.length * 110
                        : 300,
                    child: Observer(
                      builder: (_) =>
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.addressState.addressList.length,
                            itemBuilder: (context, index) =>
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor:
                                        AppColors.textPurpleColor),
                                    child: CheckboxListTile(
                                      dense: true,
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.textPurpleColor,
                                      secondary: Icon(
                                        Icons.map_outlined,
                                        color: AppColors.anotherPurple,
                                        size: 30,
                                      ),
                                      title: Text(widget.addressState
                                          .addressList[index].address!),
                                      value: widget.addressState
                                          .checkList[index],
                                      onChanged: (selected) async {
                                        for (int i = 0;
                                        i <
                                            widget.addressState.addressList
                                                .length;
                                        i++) {
                                          widget.addressState.checkList[i] =
                                          false;
                                        }

                                        widget.addressState.defaultAddress =
                                        widget
                                            .addressState.addressList[index];
                                        widget.addressState.checkList[index] =
                                        selected!;
                                        if (selected) {
                                          widget.addressState.selectedAddress =
                                          widget.addressState
                                              .addressList[index];
                                          checkoutState.getShippingPrice(
                                              widget.addressState
                                                  .selectedAddress.latitude!,
                                              widget.addressState
                                                  .selectedAddress.longitude!);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context)
                            .push(
                          AddNewAddressRoute(
                              addressState: widget.addressState),
                        )
                            .then((value) =>
                            widget.addressState.getAddresses()),
                    child: AddNewActionWidget(
                      itemName: 'addNewAddress'.tr(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
