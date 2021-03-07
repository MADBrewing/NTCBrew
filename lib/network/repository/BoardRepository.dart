import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';
import 'package:ntcbrew/network/service/BoardService.dart';

class BoardRepository {
  final BoardService service;

  BoardRepository(this.service);

  Future<Board> addBoard(BoardAdd request) async {
    return await service.addBoard(request);
  }

  Future<RaspberryPi4> addRaspberryPi4(RaspberryPi4 request) async {
    return await service.addRaspberryPi4(request);
  }

  Future<Board> deleteBoard(BoardDelete request) async {
    return await service.deleteBoard(request);
  }

  Future<Board> getBoardById(String id) async {
    return await service.getBoardById(id);
  }

  Future<List<Board>> getBoards() async {
    return await service.getBoards();
  }

  Future<List<RaspberryPi4>> getRaspberryPi4s() async {
    return await service.getRaspberryPi4s();
  }

  Future<RaspberryPi4> getRaspberryPiById(String id) async {
    return await service.getRaspberryPiById(id);
  }
}
