import 'package:json_annotation/json_annotation.dart';
import 'Module.dart';

part 'Sensor.g.dart';

@JsonSerializable()
class Sensor {
  String id;
  String name;
  String gpioType;
  String hwIdentifier;
  String createdAt;
  String updatedAt;

  Sensor(this.id, this.name, this.gpioType, this.hwIdentifier, this.createdAt, this.updatedAt);

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
  Map<String, dynamic> toJson() => _$SensorToJson(this);
}