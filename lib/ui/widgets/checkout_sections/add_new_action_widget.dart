import 'package:flutter/material.dart';

class AddNewActionWidget extends StatelessWidget {
  final String itemName;

  const AddNewActionWidget({
    required this.itemName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 40,
          thickness: 1.5,
        ),
        Row(
          children: [
            Icon(
              Icons.add,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              itemName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}