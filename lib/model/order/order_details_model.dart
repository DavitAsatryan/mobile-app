import 'package:cursus_app/model/order/payment.dart';
import 'package:cursus_app/model/order/transportation_details.dart';
import 'package:cursus_app/model/patient/patient_model.dart';
import 'package:cursus_app/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_service_model.dart';

part 'order_details_model.freezed.dart';

part 'order_details_model.g.dart';

@freezed
class OrderDetailsModel with _$OrderDetailsModel {
  factory OrderDetailsModel({
    required int id,
    required int createdById,
    required String createdByName,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String status,
    required DateTime appointmentDate,
    required UserModel user,
    String? country,
    String? city,
    required String address,
    String? entrance,
    String? entranceCode,
    String? floor,
    required Payment payment,
    required PatientModel patient,
    @JsonKey(name: 'orderServices') required List<OrderServiceModel> services,
    TransportationDetails? transportationDetails,
  }) = _OrderDetailsModel;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);
}
