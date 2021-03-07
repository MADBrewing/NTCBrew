import 'package:ntcbrew/network/ApiResponse.dart';
import 'package:ntcbrew/network/model/Records.dart';

abstract class RecordsService {
  Future<List<Records>> getRecords();

  Future<Records> getProgramById(String id);
}
