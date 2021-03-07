// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrewingError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrewingError _$BrewingErrorFromJson(Map<String, dynamic> json) {
  return BrewingError(
    json['id'] as String,
    Records.fromJson(json['records'] as Map<String, dynamic>),
    Step.fromJson(json['step'] as Map<String, dynamic>),
    json['error'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$BrewingErrorToJson(BrewingError instance) =>
    <String, dynamic>{
      'id': instance.id,
      'records': instance.records,
      'step': instance.step,
      'error': instance.error,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
