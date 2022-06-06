import 'package:cursus_app/model/help_model/help_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_response_model.freezed.dart';
part 'help_response_model.g.dart';

@freezed
class HelpResponseModel with _$HelpResponseModel {
  factory HelpResponseModel({
    required String name,
    required List<HelpModel> children,
    bool? isOpen,
  }) = _HelpResponseModel;

  factory HelpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HelpResponseModelFromJson(json);
}
