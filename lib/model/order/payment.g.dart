// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      method: json['method'] as String,
      status: json['status'] as String,
      discount: json['discount'] as int,
      transportationPrice: json['transportationPrice'] as int,
      totalPrice: json['totalPrice'] as int,
      amountPaid: json['amountPaid'] as int,
      currency: json['currency'] as String,
      orderPrice: json['orderPrice'] as int?,
      system: json['system'] as String?,
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'method': instance.method,
      'status': instance.status,
      'discount': instance.discount,
      'transportationPrice': instance.transportationPrice,
      'totalPrice': instance.totalPrice,
      'amountPaid': instance.amountPaid,
      'currency': instance.currency,
      'orderPrice': instance.orderPrice,
      'system': instance.system,
    };
