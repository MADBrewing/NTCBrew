import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/service/RecordsService.dart';
import 'package:ntcbrew/network/service/network/RecordsNetworkService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class RecordsRepository {
  final RecordsService _service = RecordsNetworkService();

  RecordsRepository();

  NTCUiStream<Records> getProgramById(String id) {
    return NTCUiStream.create<Records>(() => _service.getRecordsById(id));
  }

  NTCUiStream<List<Records>> getRecords() {
    return NTCUiStream.create<List<Records>>(() => _service.getRecords());
  }
}
