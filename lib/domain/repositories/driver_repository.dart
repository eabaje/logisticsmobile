import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/driver.dart';

import '../../common/error/app_error.dart';

abstract class DriverRepository {
  Future<Either<AppError, List<Driver>>> getDrivers();
  
  Future<Either<AppError, Driver>> getDriverById(String id);

  Future<Either<AppError, List<Driver>>> getDriversByVehicle(String vehicleId);
 
  Future<Either<AppError, List<Driver>>> getSearchedDrivers(
      String searchTerm);
  Future<Either<AppError,  String?>> saveDriver(Map<String, dynamic> body);
  Future<Either<AppError,  String?>> editDriver(Map<String, dynamic> body);

   Future<Either<AppError, String?>> assignDriverToVehicle(Map<String, dynamic> body);

 // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
// Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
 // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}