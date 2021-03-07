import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Module.dart';

part 'Profile.g.dart';

@JsonSerializable()
class Profile {
  String id;
  Board board;
  String name;
  List<Module>? modules;
  String createdAt;
  String updatedAt;

  Profile(this.id, this.board, this.name, this.modules, this.createdAt, this.updatedAt);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}