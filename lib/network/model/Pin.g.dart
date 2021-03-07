// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pin _$PinFromJson(Map<String, dynamic> json) {
  return Pin(
    json['name'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$PinToJson(Pin instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };
