import 'package:json_annotation/json_annotation.dart';
import 'Profile.dart';
import 'Sensor.dart';

part 'Module.g.dart';

@JsonSerializable()
class Module {
  String id;
  String name;
  String createdAt;
  String updatedAt;

  Module(this.id, this.name, this.createdAt, this.updatedAt);

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}