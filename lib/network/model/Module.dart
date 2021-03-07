import 'package:json_annotation/json_annotation.dart';
import 'Profile.dart';
import 'Sensor.dart';

part 'Module.g.dart';

@JsonSerializable()
class Module {
  String id;
  Profile profile;
  String name;
  List<Sensor>? sensors;
  String createdAt;
  String updatedAt;

  Module(this.id, this.profile, this.name, this.sensors, this.createdAt, this.updatedAt);

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}