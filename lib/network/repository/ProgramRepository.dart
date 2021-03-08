import 'package:ntcbrew/network/model/Program.dart';
import 'package:ntcbrew/network/service/ProgramService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class ProgramRepository {
  final ProgramService _service;

  NTCUiStream<Program> addProgramController = NTCUiStream();
  NTCUiStream<Program> getProgramByIdController = NTCUiStream();
  NTCUiStream<List<Program>> getProgramsController = NTCUiStream();

  ProgramRepository(this._service);

  addProgram(Program request) async {
    addProgramController.getData(() => _service.addProgram(request));
  }

  getProgramById(String id) async {
    getProgramByIdController.getData(() => _service.getProgramById(id));
  }

  getPrograms() async {
    getProgramsController.getData(() => _service.getPrograms());
  }

  disposeAll() {
    addProgramController.dispose();
    getProgramByIdController.dispose();
    getProgramsController.dispose();
  }
}
