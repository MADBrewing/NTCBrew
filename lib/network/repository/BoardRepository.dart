import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/BoardAdd.dart';
import 'package:ntcbrew/network/model/BoardDelete.dart';
import 'package:ntcbrew/network/model/RaspberryPi4.dart';
import 'package:ntcbrew/network/service/BoardService.dart';
import 'package:ntcbrew/network/service/network/BoardNetworkService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class BoardRepository {
  final BoardService _service = BoardNetworkService();

  BoardRepository();

  NTCUiStream<Board> addBoard(BoardAdd request) => NTCUiStream.create<Board>(() => _service.addBoard(request));

  NTCUiStream<Board> deleteBoard(BoardDelete request) => NTCUiStream.create<Board>(() => _service.deleteBoard(request));

  NTCUiStream<Board> getBoardById(String id) => NTCUiStream.create<Board>(() => _service.getBoardById(id));

  NTCUiStream<List<Board>> getBoards() => NTCUiStream.create<List<Board>>(() => _service.getBoards());

  NTCUiStream<RaspberryPi4> addRaspberryPi4(RaspberryPi4 request) =>
      NTCUiStream.create<RaspberryPi4>(() => _service.addRaspberryPi4(request));

  NTCUiStream<List<RaspberryPi4>> getRaspberryPi4s() => NTCUiStream.create<List<RaspberryPi4>>(() => _service.getRaspberryPi4s());

  NTCUiStream<RaspberryPi4> getRaspberryPiById(String id) => NTCUiStream.create<RaspberryPi4>(() => _service.getRaspberryPiById(id));
}
