import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/service/ProfileService.dart';
import 'package:ntcbrew/network/service/network/ProfileNetworkService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class ProfileRepository {
  final ProfileService _service = ProfileNetworkService();

  NTCUiStream<List<Profile>> getProfiles() => NTCUiStream.create<List<Profile>>(() => _service.getProfiles());

  NTCUiStream<Profile> getProfileById(String id) => NTCUiStream.create<Profile>(() => _service.getProfileById(id));

  NTCUiStream<Profile> addProfile(Profile request) => NTCUiStream.create<Profile>(() => _service.addProfile(request));

  NTCUiStream<Profile> deleteProfile(String id) => NTCUiStream.create<Profile>(() => _service.deleteProfile(id));

  NTCUiStream<List<Module>> getModules() => NTCUiStream.create<List<Module>>(() => _service.getModules());

  NTCUiStream<Module> getModuleById(String id) => NTCUiStream.create<Module>(() => _service.getModuleById(id));

  NTCUiStream<Module> addModule(Module request) => NTCUiStream.create<Module>(() => _service.addModule(request));

  NTCUiStream<Module> deleteModule(String id) => NTCUiStream.create<Module>(() => _service.deleteModule(id));

  NTCUiStream<List<Sensor>> getSensors() => NTCUiStream.create<List<Sensor>>(() => _service.getSensors());

  NTCUiStream<Sensor> getSensorById(String id) => NTCUiStream.create<Sensor>(() => _service.getSensorById(id));

  NTCUiStream<Sensor> addSensor(Sensor request) => NTCUiStream.create<Sensor>(() => _service.addSensor(request));

  NTCUiStream<Sensor> deleteSensor(String id) => NTCUiStream.create<Sensor>(() => _service.deleteSensor(id));
}
