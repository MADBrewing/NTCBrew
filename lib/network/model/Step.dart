import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Program.dart';
import 'package:ntcbrew/network/model/StepAction.dart';
import 'package:ntcbrew/network/model/StepError.dart';

part 'Step.g.dart';

@JsonSerializable()
class Step {
  String id;
  Program program;
  List<StepAction>? actions;
  List<StepError>? errors;
  String name;
  String stepNo;
  double targetTemperature;
  int duration;
  double speed;
  String pinGroup;
  String createdAt;
  String updatedAt;

  Step(this.id,
      this.program,
      this.actions,
      this.errors,
      this.name,
      this.stepNo,
      this.targetTemperature,
      this.duration,
      this.speed,
      this.pinGroup,
      this.createdAt,
      this.updatedAt);

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
  Map<String, dynamic> toJson() => _$StepToJson(this);
}
