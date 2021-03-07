// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensor _$SensorFromJson(Map<String, dynamic> json) {
  return Sensor(
    json['id'] as String,
    Module.fromJson(json['module'] as Map<String, dynamic>),
    json['name'] as String,
    json['gpioType'] as String,
    json['hwIdentifier'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$SensorToJson(Sensor instance) => <String, dynamic>{
      'id': instance.id,
      'module': instance.module,
      'name': instance.name,
      'gpioType': instance.gpioType,
      'hwIdentifier': instance.hwIdentifier,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
