import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_cart_model.freezed.dart';
part 'shipping_cart_model.g.dart';

@freezed
class ShoppingCartModel with _$ShoppingCartModel {
  factory ShoppingCartModel({
    required int id,
    required String name,
    required int price,
    String? icon,

  }) = _ShoppingCartModel;

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartModelFromJson(json);
}
