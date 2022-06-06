import 'package:cursus_app/model/service_bundle/service_bundle_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';

part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  factory ServiceModel({
    required int id,
    required String name,
    String? description,
    String? createdByName,
    List<BundlesServiceModel>? bundlesServicesModel,
    String? icon,
    int? categoryId,
    int? price,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}
