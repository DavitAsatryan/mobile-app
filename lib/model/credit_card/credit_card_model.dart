import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';

part 'credit_card_model.g.dart';

@freezed
class CreditCardModel with _$CreditCardModel {
  factory CreditCardModel({
    required int id,
    required String cardholderName,
    required String maskedNumber,
    String? cardDate,
    required bool isDefault,
  }) = _CreditCardModel;

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);
}
