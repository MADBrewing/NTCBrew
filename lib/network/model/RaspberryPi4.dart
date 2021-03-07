import 'package:ntcbrew/network/model/Pin.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RaspberryPi4.g.dart';

@JsonSerializable()
class RaspberryPi4 {
  String id;
  Board board;
  Pin pin1;
  Pin pin2;
  Pin pin3;
  Pin pin4;
  Pin pin5;
  Pin pin6;
  Pin pin7;
  Pin pin8;
  Pin pin9;
  Pin pin10;
  Pin pin11;
  Pin pin12;
  Pin pin13;
  Pin pin14;
  Pin pin15;
  Pin pin16;
  Pin pin17;
  Pin pin18;
  Pin pin19;
  Pin pin20;
  Pin pin21;
  Pin pin22;
  Pin pin23;
  Pin pin24;
  Pin pin25;
  Pin pin26;
  Pin pin27;
  Pin pin28;
  Pin pin29;
  Pin pin30;
  Pin pin31;
  Pin pin32;
  Pin pin33;
  Pin pin34;
  Pin pin35;
  Pin pin36;
  Pin pin37;
  Pin pin38;
  Pin pin39;
  Pin pin40;

  RaspberryPi4(
      this.id,
      this.board,
      this.pin1,
      this.pin2,
      this.pin3,
      this.pin4,
      this.pin5,
      this.pin6,
      this.pin7,
      this.pin8,
      this.pin9,
      this.pin10,
      this.pin11,
      this.pin12,
      this.pin13,
      this.pin14,
      this.pin15,
      this.pin16,
      this.pin17,
      this.pin18,
      this.pin19,
      this.pin20,
      this.pin21,
      this.pin22,
      this.pin23,
      this.pin24,
      this.pin25,
      this.pin26,
      this.pin27,
      this.pin28,
      this.pin29,
      this.pin30,
      this.pin31,
      this.pin32,
      this.pin33,
      this.pin34,
      this.pin35,
      this.pin36,
      this.pin37,
      this.pin38,
      this.pin39,
      this.pin40);

  factory RaspberryPi4.fromJson(Map<String, dynamic> json) => _$RaspberryPi4FromJson(json);
  Map<String, dynamic> toJson() => _$RaspberryPi4ToJson(this);
}
