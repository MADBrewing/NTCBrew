import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/service/ProfileService.dart';
import 'package:ntcbrew/utils/HttpUtil.dart';

class ProfileNetworkService implements ProfileService {
  @override
  Future<List<Profile>> getProfiles() async {
    var response = await get("profile/all");
    List<Profile> data = response.map<Profile>((e) => Profile.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Profile> getProfileById(String id) async {
    var response = await get("profile/getById/$id");
    var data = Profile.fromJson(response);
    return data;
  }

  @override
  Future<Profile> addProfile(Profile request) async {
    var jsonRequest = request.toJson();
    var response = await post("profile/add", body: jsonRequest);
    var data = Profile.fromJson(response);
    return data;
  }

  @override
  Future<Profile> deleteProfile(String id) async {
    var response = await delete("profile/delete/$id");
    var data = Profile.fromJson(response);
    return data;
  }

  @override
  Future<List<Module>> getModules() async {
    var response = await get("profile/module/all");
    List<Module> data = response.map<Module>((e) => Module.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Module> getModuleById(String id) async {
    var response = await get("profile/module/getById/$id");
    var data = Module.fromJson(response);
    return data;
  }

  @override
  Future<Module> addModule(Module request) async {
    var jsonRequest = request.toJson();
    var response = await post("profile/module/add", body: jsonRequest);
    var data = Module.fromJson(response);
    return data;
  }

  @override
  Future<Module> deleteModule(String id) async {
    var response = await delete("profile/module/delete/$id");
    var data = Module.fromJson(response);
    return data;
  }

  @override
  Future<List<Sensor>> getSensors() async {
    var response = await get("profile/sensor/all");
    List<Sensor> data = response.map<Sensor>((e) => Sensor.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Sensor> getSensorById(String id) async {
    var response = await get("profile/sensor/getById/$id");
    var data = Sensor.fromJson(response);
    return data;
  }

  @override
  Future<Sensor> addSensor(Sensor request) async {
    var jsonRequest = request.toJson();
    var response = await post("profile/sensor/add", body: jsonRequest);
    var data = Sensor.fromJson(response);
    return data;
  }

  @override
  Future<Sensor> deleteSensor(String id) async {
    var response = await delete("profile/sensor/delete/$id");
    var data = Sensor.fromJson(response);
    return data;
  }
}
