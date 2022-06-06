import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_model.freezed.dart';
part 'help_model.g.dart';

@freezed
class HelpModel with _$HelpModel {
  factory HelpModel({
    required int id,
    required String question,
    required String answer,
    bool? isOpen,

  }) = _HelpModel;

  factory HelpModel.fromJson(Map<String, dynamic> json) =>
      _$HelpModelFromJson(json);
}
