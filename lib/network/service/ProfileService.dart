import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';

abstract class ProfileService {
  Future<List<Profile>> getProfiles();

  Future<Profile> getProfileById(String id);

  Future<Profile> addProfile(Profile request);

  Future<Profile> deleteProfile(String id);

  Future<List<Module>> getModules();

  Future<Module> getModuleById(String id);

  Future<Module> addModule(Module request);

  Future<Module> deleteModule(String id);

  Future<List<Sensor>> getSensors();

  Future<Sensor> getSensorById(String id);

  Future<Sensor> addSensor(Sensor request);

  Future<Sensor> deleteSensor(String id);
}
