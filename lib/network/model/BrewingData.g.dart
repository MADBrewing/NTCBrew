// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrewingData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrewingData _$BrewingDataFromJson(Map<String, dynamic> json) {
  return BrewingData(
    json['id'] as String,
    Records.fromJson(json['records'] as Map<String, dynamic>),
    Step.fromJson(json['step'] as Map<String, dynamic>),
    json['time'] as int,
    json['state'] as String,
    json['temperature'] as String,
    (json['speed'] as num).toDouble(),
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$BrewingDataToJson(BrewingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'records': instance.records,
      'step': instance.step,
      'time': instance.time,
      'state': instance.state,
      'temperature': instance.temperature,
      'speed': instance.speed,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
