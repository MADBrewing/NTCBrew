// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    json['id'] as String,
    json['model'] as String,
    json['name'] as String,
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
