import 'package:ntcbrew/network/model/Records.dart';
import 'package:ntcbrew/network/service/RecordsService.dart';
import 'package:ntcbrew/utils/HttpUtil.dart';

class RecordsNetworkService implements RecordsService {
  @override
  Future<List<Records>> getRecords() async {
    var response = await get("records/all");
    List<Records> data = response.map((e) => Records.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Records> getProgramById(String id) async {
    var response = await get("records/getById/$id");
    var data = Records.fromJson(response);
    return data;
  }
}
