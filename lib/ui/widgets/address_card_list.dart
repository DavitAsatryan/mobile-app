import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/store/address/address_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cursus_app/router.gr.dart';

import 'cursus_icons.dart';
import 'dialogs/comming_soon_dialog.dart';

class AddressCard extends StatelessWidget {
  final AddressState addressState;

  const AddressCard({Key? key, required this.addressState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Observer(
        builder: (_) => addressState.storeState.state == StoreStates.loading
            ? Loading(
                color: Colors.transparent,
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: addressState.addressList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => CommonDialog(
                            positiveCallback: () async {
                              addressState.makeDefault(
                                  addressState.addressList[index].id!);
                              await addressState.getAddresses();
                              await AutoRouter.of(context).pop();
                            },
                            negativeCallback: () async {
                              await AutoRouter.of(context).pop();
                            },
                            dialogText: 'makeDefaultAddressQuestion'.tr(),
                          )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (addressState.addressList[index].isDefault!)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'billingAddress'.tr(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth(context) * .5,
                                  child: Observer(
                                    builder: (_) => Text(
                                      addressState.addressList[index].address!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        AutoRouter.of(context).push(
                                            AddNewAddressRoute(
                                                addressState: addressState,
                                                id: addressState
                                                    .addressList[index].id,
                                                latLng: LatLng(
                                                    addressState
                                                        .addressList[index]
                                                        .latitude!,
                                                    addressState
                                                        .addressList[index]
                                                        .longitude!)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        child: Icon(
                                          CursusIcons.edit,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // addressState.addressList.removeAt(index);
                                        await addressState.deleteAddress(
                                            addressState
                                                .addressList[index].id!);
                                        await addressState.getAddresses();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        child: Icon(
                                          CursusIcons.delete,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Text(
                            //   '950 RIDGE RDC25',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 3,
                            // ),
                            // Text(
                            //   'W3075',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 3,
                            // ),
                            // Text(
                            //   'CLAYMONT, DE 19703',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
