import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_model.freezed.dart';
part 'about_us_model.g.dart';

@freezed
class AboutUsModel with _$AboutUsModel {
  factory AboutUsModel({
    required String contactAddress,
    required String contactEmail,
    required String contactPhone,
    required String contactGeocoordinates,
  }) = _AboutUsModel;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);
}
