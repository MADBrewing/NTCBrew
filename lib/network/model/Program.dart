import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Step.dart';

part 'Program.g.dart';

@JsonSerializable()
class Program {
  String id;
  String name;
  String version;
  List<Step> steps;
  String createdAt;
  String updatedAt;

  Program(this.id,
      this.name,
      this.version,
      this.steps,
      this.createdAt,
      this.updatedAt);

  factory Program.fromJson(Map<String, dynamic> json) => _$ProgramFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramToJson(this);
}