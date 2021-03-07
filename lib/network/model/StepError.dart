import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Step.dart';

part 'StepError.g.dart';

@JsonSerializable()
class StepError {

  String id;
  Step step;
  String type;
  String error;
  String createdAt;
  String updatedAt;

  StepError(this.id,
      this.step,
      this.type,
      this.error,
      this.createdAt,
      this.updatedAt);

  factory StepError.fromJson(Map<String, dynamic> json) => _$StepErrorFromJson(json);
  Map<String, dynamic> toJson() => _$StepErrorToJson(this);
}