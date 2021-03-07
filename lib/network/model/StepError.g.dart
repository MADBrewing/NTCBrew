// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepError _$StepErrorFromJson(Map<String, dynamic> json) {
  return StepError(
    json['id'] as String,
    Step.fromJson(json['step'] as Map<String, dynamic>),
    json['type'] as String,
    json['error'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$StepErrorToJson(StepError instance) => <String, dynamic>{
      'id': instance.id,
      'step': instance.step,
      'type': instance.type,
      'error': instance.error,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
