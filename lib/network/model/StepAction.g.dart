// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepAction _$StepActionFromJson(Map<String, dynamic> json) {
  return StepAction(
    json['id'] as String,
    Step.fromJson(json['step'] as Map<String, dynamic>),
    json['time'] as String,
    json['action'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$StepActionToJson(StepAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step': instance.step,
      'time': instance.time,
      'action': instance.action,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
