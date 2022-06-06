import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_bundle_model.freezed.dart';

part 'service_bundle_model.g.dart';

@freezed
class BundlesServiceModel with _$BundlesServiceModel {
  factory BundlesServiceModel({
    required int id,
    required String createdAt,
    required int bundleId,
    required int serviceId,
  }) = _BundlesServiceModel;

  factory BundlesServiceModel.fromJson(Map<String, dynamic> json) =>
      _$BundlesServiceModelFromJson(json);
}
