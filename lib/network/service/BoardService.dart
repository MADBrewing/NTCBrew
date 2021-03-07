import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';

abstract class BoardService {
  Future<List<Board>> getBoards();

  Future<Board> getBoardById(String id);

  Future<Board> addBoard(BoardAdd request);

  Future<Board> deleteBoard(BoardDelete request);

  Future<List<RaspberryPi4>> getRaspberryPi4s();

  Future<RaspberryPi4> getRaspberryPiById(String id);

  Future<RaspberryPi4> addRaspberryPi4(RaspberryPi4 request);
}
