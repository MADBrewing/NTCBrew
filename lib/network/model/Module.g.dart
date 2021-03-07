// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return Module(
    json['id'] as String,
    Profile.fromJson(json['profile'] as Map<String, dynamic>),
    json['name'] as String,
    (json['sensors'] as List<dynamic>?)
        ?.map((e) => Sensor.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'name': instance.name,
      'sensors': instance.sensors,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
