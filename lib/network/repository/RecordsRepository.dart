import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/service/RecordsService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class RecordsRepository {
  final RecordsService service;

  NTCUiStream<Records> getProgramByIdController = NTCUiStream();
  NTCUiStream<List<Records>> getRecordsController = NTCUiStream();

  RecordsRepository(this.service);

  getProgramById(String id) async {
    getProgramByIdController.getData(await service.getProgramById(id));
  }

  getRecords() async {
    getRecordsController.getData(await service.getRecords());
  }

  disposeAll() {
    getProgramByIdController.dispose();
    getRecordsController.dispose();
  }
}
