import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../values/values.dart';
import '../buttons/main_button.dart';

class DilemmaBottomSheet extends StatefulWidget {
  final String question;
  final String positiveAnswer;
  final String negativeAnswer;
  final VoidCallback positiveAnswerCallback;

  DilemmaBottomSheet({
    required this.question,
    required this.positiveAnswerCallback,
    required this.negativeAnswer,
    required this.positiveAnswer,
    Key? key,
  }) : super(key: key);

  @override
  State<DilemmaBottomSheet> createState() => _DilemmaBottomSheetState();
}

class _DilemmaBottomSheetState extends State<DilemmaBottomSheet> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: .4,
            child: Image.asset(
              'assets/icons/ill_dust.png',
              scale: 1,
              fit: BoxFit.cover,
            ),
          )),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/add_to_card_background.png',
                // scale: 1,
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                widget.question,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 22),
              ),
              const SizedBox(
                height: 40,
              ),
              MainButton(
                callback: () {
                  widget.positiveAnswerCallback();
                },
                label: widget.positiveAnswer,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => AutoRouter.of(context).pop(),
                child: Text(
                  widget.negativeAnswer,
                  style: Styles.boldTextStyle.copyWith(fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
