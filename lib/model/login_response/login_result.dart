import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.freezed.dart';

part 'login_result.g.dart';

@freezed
class LoginResult with _$LoginResult {
  factory LoginResult({
    required String jwtToken,
    required String refreshKey,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);
}
