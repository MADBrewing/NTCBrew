import 'package:json_annotation/json_annotation.dart';
part 'Board.g.dart';

@JsonSerializable()
class Board {
  String id;
  String model;
  String name;
  String updatedAt;
  String createdAt;

  Board(this.id, this.model, this.name, this.createdAt, this.updatedAt);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
  Map<String, dynamic> toJson() => _$BoardToJson(this);
}