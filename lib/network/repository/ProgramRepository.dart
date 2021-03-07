import 'package:ntcbrew/network/model/Program.dart';
import 'package:ntcbrew/network/service/ProgramService.dart';

class ProgramRepository {
  final ProgramService service;

  ProgramRepository(this.service);

  Future<Program> addProgram(Program request) async {
    return await service.addProgram(request);
  }

  Future<Program> getProgramById(String id) async {
    return await service.getProgramById(id);
  }

  Future<List<Program>> getPrograms() async {
    return await service.getPrograms();
  }
}
