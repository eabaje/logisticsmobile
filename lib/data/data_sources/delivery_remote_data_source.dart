import 'package:logisticsmobile/data/models/trip.dart';
import 'package:logisticsmobile/data/core/api_constants.dart';
import 'package:logisticsmobile/data/models/shipment.dart';
import '../core/api_client.dart';


abstract class TripShipmentRemoteDataSource {


Future<List<Trip>> getTrips();

  
Future<Trip> getTripById(String id);
 
Future<Trip> getTripByShipmentId(String shipmentId);

Future<List<Trip>> getTripsByVehicle(String vehicleId,String startDate,String endDate);

Future<List<Trip>> getTripsByDriver(String driverId,String startDate,String endDate);

Future<List<Trip>> getfindAllTripsByPickUpLocation(String pickUpLocation);

Future<List<Trip>> getfindAllTripsByDeliveryLocation(String deliveryLocation);

Future<List<Trip>> getfindAllTripsByPickUpDate(String startDate,String endDate);

Future<List<Trip>> getfindAllTripsByDeliveryDate(String startDate,String endDate);

   

Future<String> saveTrip(Map<String, dynamic> requestBody);

Future<String> editTrip(Map<String, dynamic> requestBody);




Future<List<Shipment>> getShipments();
  
Future<Shipment> getShipmentyId(String id);

Future<List<Shipment>> findAllShipmentsByStatus(String shipmentId,String shipmentStaus);

Future< List<Shipment>> findAllShipmentsAssigned(String shipmentId,bool assigned);

Future<List<Shipment>> findAllShipmentsByDeliveryDate(String fromDate, String toDate);

Future<List<Shipment>> findAllShipmentsByPickUpDate(String fromDate, String toDate);



Future<String> saveShipment(Map<String, dynamic> requestBody);

Future<String> editShipment(Map<String, dynamic> requestBody);

  




}

class TripShipmentRemoteDataSourceImpl extends TripShipmentRemoteDataSource {
  final ApiClient _client;

  TripShipmentRemoteDataSourceImpl(this._client);


@override
  Future<List<Trip>> getTrips() async {
    final response = await _client.get('${ApiConstants.BASE_URL}trip/findAll');
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
  }

 

  

  @override
  Future<Trip> getTripById(String id) async {
    final response = await _client.get('${ApiConstants.BASE_URL}trip/findOne/$id');
    final trip = Trip.fromJson(response);
    return trip;
  }

  
   @override
  Future<Trip> getTripByShipmentId(String shipmentId) async {
     final response = await _client.get('${ApiConstants.BASE_URL}trip/findOne/$shipmentId');
    final trip = Trip.fromJson(response);
    return trip;
  }

  

  @override
  Future<String> saveTrip(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.post(
      '${ApiConstants.BASE_URL}trip/create',
      params: requestBody,
    );
     return (response['message']);
  }


@override
  Future<String> editTrip(Map<String, dynamic> requestBody) async {
     final response = await _client.put(
      '${ApiConstants.BASE_URL}trip/update',
      params: requestBody,
    );
     return (response['message']);
  }
  @override
  Future<List<Trip>> getTripsByVehicle(String vehicleId,String startDate, String endDate) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByVehicle/', params: {
      'vehicleId': vehicleId,
      'startDate': startDate,
      'endDate': endDate,
    });
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
   
  }

   @override
  Future<List<Trip>> getTripsByDriver(String driverId,String startDate, String endDate) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByDriver/', params: {
      'driverId': driverId,
      'startDate': startDate,
      'endDate': endDate,
    });
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
   
  }

@override
  Future<List<Trip>> getfindAllTripsByDeliveryDate(String startDate, String endDate) async {
     final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByVehicle', params: {
      'startDate': startDate,
      'endDate': endDate,
    });
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
  }

  @override
  Future<List<Trip>> getfindAllTripsByDeliveryLocation(String deliveryLocation) async {
     final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByDeliveryLocation', params: {
      'deliveryLocation': deliveryLocation,
     
    });
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
  }

  @override
  Future<List<Trip>> getfindAllTripsByPickUpDate(String startDate, String endDate) async {
     final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByPickUpDate', params: {
     'startDate': startDate,
      'endDate': endDate,
    });

   final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
  }

  @override
  Future<List<Trip>> getfindAllTripsByPickUpLocation(String pickUpLocation) async{
     final response = await _client.get('${ApiConstants.BASE_URL}trip/findAllTripsByPickUpLocation', params: {
      'pickUpLocation': pickUpLocation,
      
    });
    final trips = Trip.fromJson(response) as  List<Trip>;
    return trips;
  }



  // Section for  Shipment

@override
  Future<List<Shipment>> getShipments() async{
    // Get all getShipments
   final response = await _client.get('${ApiConstants.BASE_URL}shipment/findAll');
    final shipments = Shipment.fromJson(response) as  List<Shipment>;
    return shipments;
  }


  @override
  Future<Shipment> getShipmentyId(String id) async{
    // 
   final response = await _client.get('${ApiConstants.BASE_URL}shipment/findOne/$id');
   final shipment = Shipment.fromJson(response);
    return shipment;
  }

@override
  Future<List<Shipment>> findAllShipmentsByDeliveryDate(String fromDate, String toDate) async {
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}shipment/findAllShipmentsByDeliveryDate/', params: {
      'fromDate': fromDate,
       'toDate': toDate,
    });
     final shipments = Shipment.fromJson(response) as  List<Shipment>;
    return shipments;
  }

  @override
  Future<List<Shipment>> findAllShipmentsByPickUpDate(String fromDate, String toDate) async {
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}shipment/findAllShipmentsByPickUpDate/', params: {
      'fromDate': fromDate,
       'toDate': toDate,
    });
     final shipments = Shipment.fromJson(response) as  List<Shipment>;
    return shipments;
  }

  @override
  Future<List<Shipment>> findAllShipmentsByStatus(String shipmentId, String shipmentStatus) async {
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}shipment/findAllShipmentsByStatus/', params: {
      'shipmentId': shipmentId,
       'shipmentStatus': shipmentStatus,
    });
     final shipments = Shipment.fromJson(response) as  List<Shipment>;
    return shipments;
  }

 @override
  Future<String> saveShipment(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.post(
      '${ApiConstants.BASE_URL}shipment/create',
      params: requestBody,
    );
     return (response['message']);
  }
  @override
  Future<String> editShipment(Map<String, dynamic> requestBody) async{
    // 
     final response = await _client.put(
      '${ApiConstants.BASE_URL}shipment/update',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<List<Shipment>> findAllShipmentsAssigned(String shipmentId, bool assignedShipment) async {
     final response = await _client.get('${ApiConstants.BASE_URL}shipment/findAllShipmentsAssigned/', params: {
      'shipmentId': shipmentId,
       'assignedShipment': assignedShipment,
    });
     final shipments = Shipment.fromJson(response) as  List<Shipment>;
    return shipments;
  }

 

  

  
  

  

  


}