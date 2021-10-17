import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/trip.dart';

import '../entities/app_error.dart';

abstract class TripRepository {


Future<Either<AppError, List<Trip>>> getTrips();
  
Future<Either<AppError, Trip>> getTripById(String id);

Future<Either<AppError, Trip>> getTripByShipmentId(String shipmentId);
 
Future<Either<AppError,List<Trip>>> getTripsByVehicle(String vehicleId,String startDate,String endDate);

Future<Either<AppError,List<Trip>>> getTripsByDriver(String driverId,String startDate,String endDate);

Future<Either<AppError, List<Trip>>> getfindAllTripsByPickUpLocation(String pickUpLocation);

Future<Either<AppError, List<Trip>>> getfindAllTripsByDeliveryLocation(String deliveryLocation);

Future<Either<AppError, List<Trip>>> getfindAllTripsByPickUpDate(String startDate,String endDate);

Future<Either<AppError, List<Trip>>> getfindAllTripsByDeliveryDate(String startDate,String endDate);


  Future<Either<AppError, String>> saveTrip(Map<String, dynamic> body);

  Future<Either<AppError, String>> editTrip(Map<String, dynamic> body);


 // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
 //Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
 // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}