import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Step.dart';

part 'StepAction.g.dart';

@JsonSerializable()
class StepAction {

  String id;
  Step step;
  String time;
  String action;
  String createdAt;
  String updatedAt;

  StepAction(this.id,
      this.step,
      this.time,
      this.action,
      this.createdAt,
      this.updatedAt);

  factory StepAction.fromJson(Map<String, dynamic> json) => _$StepActionFromJson(json);
  Map<String, dynamic> toJson() => _$StepActionToJson(this);
}