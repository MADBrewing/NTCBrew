// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) {
  return Program(
    json['id'] as String,
    json['name'] as String,
    json['version'] as String,
    (json['steps'] as List<dynamic>)
        .map((e) => Step.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'version': instance.version,
      'steps': instance.steps,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
