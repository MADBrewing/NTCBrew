import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';
import 'package:ntcbrew/network/service/BoardService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class BoardRepository {
  final BoardService _service;

  NTCUiStream<Board> addBoardController = NTCUiStream();
  NTCUiStream<Board> deleteBoardController = NTCUiStream();
  NTCUiStream<Board> getBoardByIdController = NTCUiStream();
  NTCUiStream<List<Board>> getBoardsController = NTCUiStream();
  NTCUiStream<RaspberryPi4> addRaspberryController = NTCUiStream();
  NTCUiStream<List<RaspberryPi4>> getRaspberryPi4sController = NTCUiStream();
  NTCUiStream<RaspberryPi4> getRaspberryPiByIdController = NTCUiStream();

  BoardRepository(this._service);

  addBoard(BoardAdd request) async {
    addBoardController.getData(await _service.addBoard(request));
  }

  deleteBoard(BoardDelete request) async {
    deleteBoardController.getData(await _service.deleteBoard(request));
  }

  getBoardById(String id) async {
    getBoardByIdController.getData(await _service.getBoardById(id));
  }

  getBoards() async {
    getBoardsController.getData(await _service.getBoards());
  }

  addRaspberryPi4(RaspberryPi4 request) async {
    addRaspberryController.getData(await _service.addRaspberryPi4(request));
  }

  getRaspberryPi4s() async {
    getRaspberryPi4sController.getData(await _service.getRaspberryPi4s());
  }

  getRaspberryPiById(String id) async {
    getRaspberryPiByIdController.getData(await _service.getRaspberryPiById(id));
  }

  disposeAll() {
    addBoardController.dispose();
    deleteBoardController.dispose();
    getBoardByIdController.dispose();
    getBoardsController.dispose();
    addRaspberryController.dispose();
    getRaspberryPi4sController.dispose();
    getRaspberryPiByIdController.dispose();
  }
}
