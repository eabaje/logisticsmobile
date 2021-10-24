import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';

import '../../common/error/app_error.dart';

abstract class VehicleRepository {
  Future<Either<AppError, List<Vehicle>>> getVehicles();

  Future<Either<AppError, List<Vehicle>>> getVehiclesByVehicleType(String vehicleType);
  
  Future<Either<AppError, Vehicle>> getVehicleById(String id);
 
  Future<Either<AppError, String>> saveVehicle(Map<String, dynamic> body);

  Future<Either<AppError, String>> editVehicle(Map<String, dynamic> body);

 // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
 //Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
 // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}