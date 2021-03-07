// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Records _$RecordsFromJson(Map<String, dynamic> json) {
  return Records(
    json['id'] as String,
    json['program'] == null
        ? null
        : Program.fromJson(json['program'] as Map<String, dynamic>),
    json['board'] == null
        ? null
        : Board.fromJson(json['board'] as Map<String, dynamic>),
    json['name'] as String,
    json['state'] as String,
    (json['data'] as List<dynamic>?)
        ?.map((e) => BrewingData.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['errors'] as List<dynamic>?)
        ?.map((e) => BrewingError.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'board': instance.board,
      'name': instance.name,
      'state': instance.state,
      'data': instance.data,
      'errors': instance.errors,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
