import 'package:cursus_app/model/order/branch_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transportation_details.freezed.dart';
part 'transportation_details.g.dart';

@freezed
class TransportationDetails with _$TransportationDetails {
  factory TransportationDetails({
    required Branch branch,
    required String duration,
    required int price,
    required double km,
  }) = _TransportationDetails;

  factory TransportationDetails.fromJson(Map<String, dynamic> json) =>
      _$TransportationDetailsFromJson(json);
}
