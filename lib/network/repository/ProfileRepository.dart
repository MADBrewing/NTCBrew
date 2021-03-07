import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/service/ProfileService.dart';

class ProfileRepository {
  final ProfileService service;

  ProfileRepository(this.service);

  Future<Module> addModule(Module request) async {
    return await service.addModule(request);
  }

  Future<Profile> addProfile(Profile request) async {
    return await service.addProfile(request);
  }

  Future<Sensor> addSensor(Sensor request) async {
    return await service.addSensor(request);
  }

  Future<Module> deleteModule(String id) async {
    return await service.deleteModule(id);
  }

  Future<Profile> deleteProfile(String id) async {
    return await service.deleteProfile(id);
  }

  Future<Sensor> deleteSensor(String id) async {
    return await service.deleteSensor(id);
  }

  Future<Module> getModuleById(String id) async {
    return await service.getModuleById(id);
  }

  Future<List<Module>> getModules() async {
    return await service.getModules();
  }

  Future<Profile> getProfileById(String id) async {
    return await service.getProfileById(id);
  }

  Future<List<Profile>> getProfiles() async {
    return await service.getProfiles();
  }

  Future<Sensor> getSensorById(String id) async {
    return await service.getSensorById(id);
  }

  Future<List<Sensor>> getSensors() async {
    return await service.getSensors();
  }
}
