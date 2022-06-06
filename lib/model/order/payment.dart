import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  factory Payment({
    required int id,
    required DateTime createdAt,
    required String method,
    required String status,
    required int discount,
    required int transportationPrice,
    required int totalPrice,
    required int amountPaid,
    required String currency,
    int? orderPrice,
    String? system,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
