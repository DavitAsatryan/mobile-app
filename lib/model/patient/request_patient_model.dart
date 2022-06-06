import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_patient_model.freezed.dart';
part 'request_patient_model.g.dart';

@freezed
class RequestPatientModel with _$RequestPatientModel {
  factory RequestPatientModel({
    required String firstName,
    required String lastName,
    @JsonKey(includeIfNull: false) DateTime? birthDate,
    @JsonKey(includeIfNull: false) String? email,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false) String? gender,
    @JsonKey(includeIfNull: false) String? country,
    @JsonKey(includeIfNull: false) String? city,
  }) = _RequestPatientModel;

  factory RequestPatientModel.fromJson(Map<String, dynamic> json) =>
      _$RequestPatientModelFromJson(json);
}
