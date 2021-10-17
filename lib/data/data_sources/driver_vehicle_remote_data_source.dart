import 'package:logisticsmobile/data/models/driver.dart';
import 'package:logisticsmobile/data/core/api_constants.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';
import '../core/api_client.dart';


abstract class DriverVehicleRemoteDataSource {
 Future<List<Driver>> getDrivers();
  
  Future<Driver> getDriverById(String id);
 
  Future<List<Driver>> getSearchedDrivers(String searchTerm);

   Future<List<Driver>> getDriversByVehicle(String vehicleId);

  Future<String> saveDriver(Map<String, dynamic> requestBody);

  Future<String> editDriver(Map<String, dynamic> requestBody);

   Future<String?> assignDriverToVehicle(Map<String, dynamic> requestBody);


 Future<List<Vehicle>> getVehicles();

 Future<List<Vehicle>> getVehiclesByVehicleType(String vehicleType);
  
  Future<Vehicle> getVehicleById(String id);

  Future<String> saveVehicle(Map<String, dynamic> requestBody);

  Future<String> editVehicle(Map<String, dynamic> requestBody);

  




}

class DriverVehicleRemoteDataSourceImpl extends DriverVehicleRemoteDataSource {
  final ApiClient _client;

  DriverVehicleRemoteDataSourceImpl(this._client);


@override
  Future<List<Driver>> getDrivers() async {
    final response = await _client.get('${ApiConstants.BASE_URL}driver/findAll');
    final drivers = Driver.fromJson(response) as  List<Driver>;
    return drivers;
  }

  @override
  Future<String?> assignDriverToVehicle(Map<String, dynamic> requestBody) async{
    // 

   final response = await _client.post(
      '${ApiConstants.BASE_URL}driver/assigndrivertovehicle/',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<String> editDriver(Map<String, dynamic> requestBody) async {
     final response = await _client.put(
      '${ApiConstants.BASE_URL}driver/update',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<Driver> getDriverById(String id) async {
    final response = await _client.get('${ApiConstants.BASE_URL}driver/findOne/$id');
    final drivers = Driver.fromJson(response);
    return drivers;
  }

  @override
  Future<List<Driver>> getSearchedDrivers(String searchTerm) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}driver/findalldriversbyname/', params: {
      'driverName': searchTerm,
    });
     final drivers = Driver.fromJson(response) as  List<Driver>;
    return drivers;
  }

  @override
  Future<String> saveDriver(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.post(
      '${ApiConstants.BASE_URL}driver/create',
      params: requestBody,
    );
     return (response['message']);
  }


  @override
  Future<List<Driver>> getDriversByVehicle(String vehicleId) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}driver/findAllDriversByVehicle/{vehicleId}');
    final drivers = Driver.fromJson(response) as  List<Driver>;
    return drivers;
   
  }



// Vehicle 


   @override
  Future<List<Vehicle>> getVehicles() async {
    final response = await _client.get('${ApiConstants.BASE_URL}vehicle/findAll');
    final vehicles = Vehicle.fromJson(response) as  List<Vehicle>;
    return vehicles;
  }

 @override
  Future<Vehicle> getVehicleById(String id) async{
     final response = await _client.get('${ApiConstants.BASE_URL}vehicle/findOne/$id');
    final vehicle = Vehicle.fromJson(response);
     return vehicle;
  }


  @override
  Future<String> editVehicle(Map<String, dynamic> requestBody) async {
    // 
   final response = await _client.put(
      '${ApiConstants.BASE_URL}vehicle/update',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<String> saveVehicle(Map<String, dynamic> requestBody) async {
    
   final response = await _client.post(
      '${ApiConstants.BASE_URL}vehicle/create',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<List<Vehicle>> getVehiclesByVehicleType(String vehicleType) async {
    final response = await _client.get('${ApiConstants.BASE_URL}vehicle/findAll/$vehicleType');
    final vehicles = Vehicle.fromJson(response) as  List<Vehicle>;
    return vehicles;
  }


}