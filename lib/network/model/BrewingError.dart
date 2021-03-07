import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/model/Step.dart';

part 'BrewingError.g.dart';

@JsonSerializable()
class BrewingError {
  String id;
  Records records;
  Step step;
  String error;
  String createdAt;
  String updatedAt;

  BrewingError(this.id,
      this.records,
      this.step,
      this.error,
      this.createdAt,
      this.updatedAt);

  factory BrewingError.fromJson(Map<String, dynamic> json) => _$BrewingErrorFromJson(json);
  Map<String, dynamic> toJson() => _$BrewingErrorToJson(this);
}