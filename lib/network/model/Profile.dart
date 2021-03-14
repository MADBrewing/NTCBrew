import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Module.dart';

part 'Profile.g.dart';

@JsonSerializable()
class Profile {
  String id;
  Board board;
  String name;
  String createdAt;
  String updatedAt;

  Profile(this.id, this.board, this.name, this.createdAt, this.updatedAt);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}