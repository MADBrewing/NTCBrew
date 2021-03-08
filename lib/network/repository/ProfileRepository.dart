import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/service/ProfileService.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class ProfileRepository {
  final ProfileService _service;

  NTCUiStream<List<Profile>> getProfilesController = NTCUiStream();
  NTCUiStream<Profile> getProfileByIdController = NTCUiStream();
  NTCUiStream<Profile> addProfileController = NTCUiStream();
  NTCUiStream<Profile> deleteProfileController = NTCUiStream();

  NTCUiStream<List<Module>> getModulesController = NTCUiStream();
  NTCUiStream<Module> getModuleByIdController = NTCUiStream();
  NTCUiStream<Module> addModuleController = NTCUiStream();
  NTCUiStream<Module> deleteModuleController = NTCUiStream();

  NTCUiStream<List<Sensor>> getSensorsController = NTCUiStream();
  NTCUiStream<Sensor> getSensorByIdController = NTCUiStream();
  NTCUiStream<Sensor> addSensorController = NTCUiStream();
  NTCUiStream<Sensor> deleteSensorController = NTCUiStream();

  ProfileRepository(this._service);

  getProfiles() async {
    getProfilesController.getData(await _service.getProfiles());
  }

  getProfileById(String id) async {
    getProfileByIdController.getData(await _service.getProfileById(id));
  }

  addProfile(Profile request) async {
    addProfileController.getData(await _service.addProfile(request));
  }

  deleteProfile(String id) async {
    deleteProfileController.getData(await _service.deleteProfile(id));
  }

  getModules() async {
    getModulesController.getData(await _service.getModules());
  }

  getModuleById(String id) async {
    getModuleByIdController.getData(await _service.getModuleById(id));
  }

  addModule(Module request) async {
    addModuleController.getData(await _service.addModule(request));
  }

  deleteModule(String id) async {
    deleteModuleController.getData(await _service.deleteModule(id));
  }

  getSensors() async {
    getSensorsController.getData(await _service.getSensors());
  }

  getSensorById(String id) async {
    getSensorByIdController.getData(await _service.getSensorById(id));
  }

  addSensor(Sensor request) async {
    addSensorController.getData(await _service.addSensor(request));
  }

  deleteSensor(String id) async {
    deleteSensorController.getData(await _service.deleteSensor(id));
  }

  disposeAll() {
    getProfilesController.dispose();
    getProfileByIdController.dispose();
    addProfileController.dispose();
    deleteProfileController.dispose();
    getModulesController.dispose();
    getModuleByIdController.dispose();
    addModuleController.dispose();
    deleteModuleController.dispose();
    getSensorsController.dispose();
    getSensorByIdController.dispose();
    addSensorController.dispose();
    deleteSensorController.dispose();
  }
}
