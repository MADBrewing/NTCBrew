// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) {
  return Step(
    json['id'] as String,
    Program.fromJson(json['program'] as Map<String, dynamic>),
    (json['actions'] as List<dynamic>?)
        ?.map((e) => StepAction.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['errors'] as List<dynamic>?)
        ?.map((e) => StepError.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['name'] as String,
    json['stepNo'] as String,
    (json['targetTemperature'] as num).toDouble(),
    json['duration'] as int,
    (json['speed'] as num).toDouble(),
    json['pinGroup'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'actions': instance.actions,
      'errors': instance.errors,
      'name': instance.name,
      'stepNo': instance.stepNo,
      'targetTemperature': instance.targetTemperature,
      'duration': instance.duration,
      'speed': instance.speed,
      'pinGroup': instance.pinGroup,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
