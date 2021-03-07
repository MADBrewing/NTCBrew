import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BrewingData.dart';
import 'package:ntcbrew/network/model/BrewingError.dart';
import 'package:ntcbrew/network/model/Program.dart';

part 'Records.g.dart';

@JsonSerializable()
class Records {
  String id;
  Program? program;
  Board? board;
  String name;
  String state;
  List<BrewingData>? data;
  List<BrewingError>? errors;
  String createdAt;
  String updatedAt;

  Records(this.id,
      this.program,
      this.board,
      this.name,
      this.state,
      this.data,
      this.errors,
      this.createdAt,
      this.updatedAt);

  factory Records.fromJson(Map<String, dynamic> json) => _$RecordsFromJson(json);
  Map<String, dynamic> toJson() => _$RecordsToJson(this);
}