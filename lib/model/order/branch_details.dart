import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_details.freezed.dart';
part 'branch_details.g.dart';

@freezed
class Branch with _$Branch {
  factory Branch({
    required int id,
    required DateTime createdAt,
    String? latitude,
    String? longitude,
    String? name,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}
