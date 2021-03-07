import 'package:json_annotation/json_annotation.dart';

part 'Pin.g.dart';

@JsonSerializable()
class Pin {
  String name;
  String type;

  Pin(this.name, this.type);

  factory Pin.fromJson(Map<String, dynamic> json) => _$PinFromJson(json);
  Map<String, dynamic> toJson() => _$PinToJson(this);
}