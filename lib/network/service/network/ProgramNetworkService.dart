import 'dart:convert';

import 'package:ntcbrew/network/model/Program.dart';
import 'package:ntcbrew/network/service/ProgramService.dart';
import 'package:ntcbrew/utils/HttpUtil.dart';

class ProgramNetworkService implements ProgramService {
  @override
  Future<List<Program>> getPrograms() async {
    var response = await get("program/all");
    List<dynamic> jsonResponse = jsonDecode(response.body) ?? List.empty();
    List<Program> data = jsonResponse.map((e) => Program.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Program> getProgramById(String id) async {
    var response = await get("program/getById/$id");
    var jsonResponse = jsonDecode(response.body);
    var data = Program.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<Program> addProgram(Program request) async {
    var jsonRequest = request.toJson();
    var response = await post("program/add", body: jsonRequest);
    var jsonResponse = jsonDecode(response.body);
    var data = Program.fromJson(jsonResponse);
    return data;
  }
}
