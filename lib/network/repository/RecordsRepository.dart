import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/service/RecordsService.dart';

class RecordsRepository {
  final RecordsService service;

  RecordsRepository(this.service);

  Future<Records> getProgramById(String id) async {
    return await service.getProgramById(id);
  }

  Future<List<Records>> getRecords() async {
    return await service.getRecords();
  }
}
