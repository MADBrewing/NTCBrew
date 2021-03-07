import 'package:json_annotation/json_annotation.dart';

part 'BoardAdd.g.dart';

@JsonSerializable()
class BoardAdd {
  String model;
  String name;

  BoardAdd(this.model, this.name);

  factory BoardAdd.fromJson(Map<String, dynamic> json) => _$BoardAddFromJson(json);
  Map<String, dynamic> toJson() => _$BoardAddToJson(this);
}