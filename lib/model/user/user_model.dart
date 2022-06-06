import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? defaultPicture,
    required String firstName,
    required String lastName,
    required String phone,
    String? gender,
    String? country,
    String? city,
    String? email,
    String? imageUrl,
    DateTime? birthDate,
    String? profilePicture,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
