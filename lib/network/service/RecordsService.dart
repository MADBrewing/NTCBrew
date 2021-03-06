import 'package:ntcbrew/network/model/Records.dart';

abstract class RecordsService {
  Future<List<Records>> getRecords();

  Future<Records> getRecordsById(String id);
}
