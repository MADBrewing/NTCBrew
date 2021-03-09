import 'package:ntcbrew/network/model/Program.dart';
import 'package:ntcbrew/network/service/ProgramService.dart';
import 'package:ntcbrew/network/service/network/ProgramNetworkService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class ProgramRepository {
  final ProgramService _service = ProgramNetworkService();

  ProgramRepository();

  NTCUiStream<Program> addProgram(Program request) => NTCUiStream.create<Program>(() => _service.addProgram(request));

  NTCUiStream<Program> getProgramById(String id) => NTCUiStream.create<Program>(() => _service.getProgramById(id));

  NTCUiStream<List<Program>> getPrograms() => NTCUiStream.create<List<Program>>(() => _service.getPrograms());
}
