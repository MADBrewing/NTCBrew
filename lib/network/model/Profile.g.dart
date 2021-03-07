// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['id'] as String,
    Board.fromJson(json['board'] as Map<String, dynamic>),
    json['name'] as String,
    (json['modules'] as List<dynamic>?)
        ?.map((e) => Module.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createdAt'] as String,
    json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'board': instance.board,
      'name': instance.name,
      'modules': instance.modules,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
