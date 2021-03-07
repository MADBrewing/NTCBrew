import 'package:ntcbrew/network/ApiResponse.dart';
import 'package:ntcbrew/network/model/Program.dart';

abstract class ProgramService {
  Future<List<Program>> getPrograms();

  Future<Program> getProgramById(String id);

  Future<Program> addProgram(Program request);
}
