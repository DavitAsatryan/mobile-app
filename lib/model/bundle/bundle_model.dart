import 'package:cursus_app/model/service/service_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_model.freezed.dart';
part 'bundle_model.g.dart';

@freezed
class BundleModel with _$BundleModel {
  factory BundleModel({
    required int id,
    required String createdAt,
    required String name,
    required String description,
    List<ServiceModel>? services,
    int? price,
    String? icon,
    String? category,
  }) = _BundleModel;

  factory BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);
}
