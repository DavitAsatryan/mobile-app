import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    int? id,
    String? zipCode,
    String? country,
    String? floor,
    String? city,
    bool? isDefault,
    String? address,
    double? latitude,
    double? longitude,
    String? entranceCode,
    String? entrance,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
