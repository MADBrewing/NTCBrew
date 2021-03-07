import 'package:json_annotation/json_annotation.dart';
import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/model/Step.dart';

part 'BrewingData.g.dart';

@JsonSerializable()
class BrewingData {
  String id;
  Records records;
  Step step;
  int time;
  String state;
  String temperature;
  double speed;
  String createdAt;
  String updatedAt;

  BrewingData(this.id,
      this.records,
      this.step,
      this.time,
      this.state,
      this.temperature,
      this.speed,
      this.createdAt,
      this.updatedAt);

  factory BrewingData.fromJson(Map<String, dynamic> json) => _$BrewingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BrewingDataToJson(this);
}