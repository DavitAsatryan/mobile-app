import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/address/address_state.dart';
import 'package:cursus_app/ui/widgets/add_text_button.dart';
import 'package:cursus_app/ui/widgets/address_card_list.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  _AddressesPageState createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  final AddressState addressState = AddressState();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Addresses',
        toolBarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressCard(addressState: addressState),
                SizedBox(
                  height: 20,
                ),
                AddTextButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(AddNewAddressRoute(addressState: addressState));
                  },
                  name: 'Add New Address',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getInfo() async {
    await addressState.getAddresses();
  }
}
