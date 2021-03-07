import 'dart:async';

import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';
import 'package:ntcbrew/network/service/BoardService.dart';
import 'package:ntcbrew/ui/UiState.dart';

class BoardRepository {
  final BoardService _service;

  late StreamController<UiState<Board>> _addBoardController;
  late StreamController<UiState<Board>> _deleteBoardController;
  late StreamController<UiState<Board>> _getBoardByIdController;
  late StreamController<UiState<List<Board>>> _getBoardsController;
  late StreamController<UiState<RaspberryPi4>> _addRaspberryController;
  late StreamController<UiState<List<RaspberryPi4>>> _getRaspberryPi4sController;
  late StreamController<UiState<RaspberryPi4>> _getRaspberryPiByIdController;

  StreamSink<UiState<Board>> get addBoardSink =>
      _addBoardController.sink;

  Stream<UiState<Board>> get addBoardStream =>
      _addBoardController.stream;

  StreamSink<UiState<Board>> get deleteBoardSink =>
      _deleteBoardController.sink;

  Stream<UiState<Board>> get deleteBoardStream =>
      _deleteBoardController.stream;

  StreamSink<UiState<Board>> get getBoardByIdSink =>
      _getBoardByIdController.sink;

  Stream<UiState<Board>> get getBoardByIdStream =>
      _getBoardByIdController.stream;

  StreamSink<UiState<List<Board>>> get getBoardsSink =>
      _getBoardsController.sink;

  Stream<UiState<List<Board>>> get getBoardsStream =>
      _getBoardsController.stream;

  StreamSink<UiState<List<RaspberryPi4>>> get getRaspberryPi4sSink =>
      _getRaspberryPi4sController.sink;

  Stream<UiState<List<RaspberryPi4>>> get getRaspberryPi4sStream =>
      _getRaspberryPi4sController.stream;

  StreamSink<UiState<RaspberryPi4>> get addRaspberrySink =>
      _addRaspberryController.sink;

  Stream<UiState<RaspberryPi4>> get addRaspberryStream =>
      _addRaspberryController.stream;

  StreamSink<UiState<RaspberryPi4>> get getRaspberryPiByIdSink =>
      _getRaspberryPiByIdController.sink;

  Stream<UiState<RaspberryPi4>> get getRaspberryPiByIdStream =>
      _getRaspberryPiByIdController.stream;

  BoardRepository(this._service) {
    _addBoardController = StreamController<UiState<Board>>();
    _deleteBoardController = StreamController<UiState<Board>>();
    _getBoardByIdController = StreamController<UiState<Board>>();
    _getBoardsController = StreamController<UiState<List<Board>>>();
    _addRaspberryController = StreamController<UiState<RaspberryPi4>>();
    _getRaspberryPi4sController = StreamController<UiState<List<RaspberryPi4>>>();
    _getRaspberryPiByIdController = StreamController<UiState<RaspberryPi4>>();
  }

  addBoard(BoardAdd request) async {
    addBoardSink.add(UiState.loading());
    try {
      var data = await _service.addBoard(request);
      addBoardSink.add(UiState.complete(data));
    } catch (e) {
      addBoardSink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  deleteBoard(BoardDelete request) async {
    deleteBoardSink.add(UiState.loading());
    try {
      var data = await _service.deleteBoard(request);
      deleteBoardSink.add(UiState.complete(data));
    } catch (e) {
      deleteBoardSink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  getBoardById(String id) async {
    getBoardByIdSink.add(UiState.loading());
    try {
      var data = await _service.getBoardById(id);
      getBoardByIdSink.add(UiState.complete(data));
    } catch (e) {
      getBoardByIdSink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  getBoards() async {
    getBoardsSink.add(UiState.loading());
    try {
      var data = await _service.getBoards();
      getBoardsSink.add(UiState.complete(data));
    } catch (e) {
      getBoardsSink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  addRaspberryPi4(RaspberryPi4 request) async {
    addRaspberrySink.add(UiState.loading());
    try {
      var data = await _service.addRaspberryPi4(request);
      addRaspberrySink.add(UiState.complete(data));
    } catch (e) {
      addRaspberrySink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  getRaspberryPi4s() async {
    getRaspberryPi4sSink.add(UiState.loading());
    try {
      var data = await _service.getRaspberryPi4s();
      getRaspberryPi4sSink.add(UiState.complete(data));
    } catch (e) {
      getRaspberryPi4sSink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  getRaspberryPiById(String id) async {
    getRaspberryPiByIdSink.add(UiState.loading());
    try {
      var data = await _service.getRaspberryPiById(id);
      getRaspberryPiByIdSink.add(UiState.complete(data));
    } catch (e) {
      getRaspberryPiByIdSink.add(UiState.error(ErrorState(e.toString())));
    }
  }
}
