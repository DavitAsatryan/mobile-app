import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';


class DeleteConfirmationBottomSheet extends StatefulWidget {
  final String? mainTitle;
  final String? title;
  final Color? firstButtonColor;
  final String? firstButtonText;
  final VoidCallback? onConfirm;

  const DeleteConfirmationBottomSheet(
      {Key? key,
      this.title,
      this.onConfirm,
      this.mainTitle,
      this.firstButtonColor,
      this.firstButtonText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeleteConfirmationBottomSheetState();
}

class _DeleteConfirmationBottomSheetState
    extends State<DeleteConfirmationBottomSheet> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'widget.mainTitle',
                      style: TextStyle(
                          color: blueyGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'widget.title',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: widget.firstButtonColor),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'widget.firstButtonText',
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.white),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'keywords.cancel',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
