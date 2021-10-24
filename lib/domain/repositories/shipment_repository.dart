import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/shipment.dart';


import '../../common/error/app_error.dart';

abstract class ShipmentRepository {


  

Future<Either<AppError, List<Shipment>>> getShipments();
  
Future<Either<AppError, Shipment>> getShipmentyId(String id);

Future<Either<AppError, List<Shipment>>> findAllShipmentsAssigned(String shipmentId,bool assignedShipment);

Future<Either<AppError, List<Shipment>>> findAllShipmentsByStatus(String shipmentId,String shipmentStaus);

Future<Either<AppError, List<Shipment>>> findAllShipmentsByDeliveryDate(String fromDate, String toDate);

Future<Either<AppError, List<Shipment>>> findAllShipmentsByPickUpDate(String fromDate, String toDate);



 Future<Either<AppError, String>> saveShipment(Map<String, dynamic> requestBody);

 Future<Either<AppError, String>> editShipment(Map<String, dynamic> requestBody);
}