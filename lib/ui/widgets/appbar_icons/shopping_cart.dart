import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ShoppingCart extends StatefulWidget {
  final Color? color;

  const ShoppingCart({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final checkoutState = GetIt.I<CheckoutState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(CartRoute()),
      child: Observer(
        builder: (_) => Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
            //  size: 30,
              color: widget.color ?? AppColors.black,
            ),
            if (checkoutState.checkoutList.length > 0)
              Positioned(
                right: -5,
                bottom: -5,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textPurpleColor.withOpacity(.9)),
                  child: Center(
                      child: Observer(
                    builder: (_) => Text(
                      checkoutState.checkoutList.length.toString(),
                      style: TextStyle(color: AppColors.white),
                    ),
                  )),
                ),
              )
          ],
        ),
      ),
    );
  }
}
