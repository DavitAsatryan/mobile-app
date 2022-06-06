import 'package:cursus_app/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class PatientModel with _$PatientModel {
  factory PatientModel({
    required int id,
    required String firstName,
    required String lastName,
    required String defaultPicture,
    DateTime? birthDate,
    String? email,
    UserModel? user,
    String? phone,
    String? gender,
    String? country,
    String? city,
    String? profilePicture,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
}
