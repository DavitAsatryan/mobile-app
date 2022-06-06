import 'package:cursus_app/model/service/service_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_service_model.freezed.dart';
part 'order_service_model.g.dart';

@freezed
class OrderServiceModel with _$OrderServiceModel {
  factory OrderServiceModel({
    required int id,
    required DateTime createdAt,
    required String status,
    required List<String> attachments,
    ServiceModel? service,
    String? notes,
    String? diagnosis,
  }) = _OrderServiceModel;

  factory OrderServiceModel.fromJson(Map<String, dynamic> json) =>
      _$OrderServiceModelFromJson(json);
}
