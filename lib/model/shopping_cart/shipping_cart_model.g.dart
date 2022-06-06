// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingCartModel _$$_ShoppingCartModelFromJson(Map<String, dynamic> json) =>
    _$_ShoppingCartModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_ShoppingCartModelToJson(
        _$_ShoppingCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'icon': instance.icon,
    };
