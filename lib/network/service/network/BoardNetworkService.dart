import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';
import 'package:ntcbrew/network/service/BoardService.dart';
import 'package:ntcbrew/utils/HttpUtil.dart';

class BoardNetworkService implements BoardService {
  @override
  Future<List<Board>> getBoards() async {
      var response = await get("boards/all");
      List<Board> data = response.map((e) => Board.fromJson(e)).toList();
      return data;
  }

  @override
  Future<Board> getBoardById(String id) async {
    var response = await get("boards/getById/$id");
    var data = Board.fromJson(response);
    return data;
  }

  @override
  Future<Board> addBoard(BoardAdd request) async {
    var jsonRequest = request.toJson();
    var response = await post("boards/add", body: jsonRequest);
    var data = Board.fromJson(response);
    return data;
  }

  @override
  Future<Board> deleteBoard(BoardDelete request) async {
    var jsonRequest = request.toJson();
    var response = await delete("boards/delete", body: jsonRequest);
    var data = Board.fromJson(response);
    return data;
  }

  @override
  Future<List<RaspberryPi4>> getRaspberryPi4s() async {
    var response = await get("raspberryPi4/all");
    List<RaspberryPi4> data = response.map((e) => RaspberryPi4.fromJson(e)).toList();
    return data;
  }

  @override
  Future<RaspberryPi4> getRaspberryPiById(String id) async {
    var response = await get("raspberryPi4/getById/$id");
    var data = RaspberryPi4.fromJson(response);
    return data;
  }

  @override
  Future<RaspberryPi4> addRaspberryPi4(RaspberryPi4 request) async {
    var jsonRequest = request.toJson();
    var response = await post("raspberryPi4/add", body: jsonRequest);
    var data = RaspberryPi4.fromJson(response);
    return data;
  }
}
