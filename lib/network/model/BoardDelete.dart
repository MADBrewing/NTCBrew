import 'package:json_annotation/json_annotation.dart';
part 'BoardDelete.g.dart';

@JsonSerializable()
class BoardDelete {
  String id;

  BoardDelete(this.id);

  factory BoardDelete.fromJson(Map<String, dynamic> json) => _$BoardDeleteFromJson(json);
  Map<String, dynamic> toJson() => _$BoardDeleteToJson(this);
}