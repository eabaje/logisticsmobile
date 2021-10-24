import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/driver.dart';
import 'package:logisticsmobile/domain/repositories/driver_repository.dart';
import '../../common/error/app_error.dart';
import '../data_sources/movie_local_data_source.dart';
import '../data_sources/driver_vehicle_remote_data_source.dart';

//import '../tables/movie_table.dart';

class DriverRepositoryImpl extends DriverRepository {
  final DriverVehicleRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  DriverRepositoryImpl(this.remoteDataSource, this.localDataSource);


  

  // @override
  // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
  //   try {
  //     final response = await localDataSource.getMovies();
  //     return Right(response);
  //   } on Exception {
  //     return Left(AppError(AppErrorType.database));
  //   }
  // }

 

  @override
  Future<Either<AppError, String?>> assignDriverToVehicle(Map<String, dynamic> body) async{
    // 
 try {
      final assign = await remoteDataSource.assignDriverToVehicle(body);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }

    
  }

  @override
  Future<Either<AppError,  String?>> editDriver(Map<String, dynamic> body) async{
    // 
  try {
      final assign = await remoteDataSource.editDriver(body);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Driver>> getDriverById(String id) async {
    // 
     // 
  try {
      final assign = await remoteDataSource.getDriverById(id);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Driver>>> getDrivers() async {
    // 
   try {
      final assign = await remoteDataSource.getDrivers();
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 @override
  Future<Either<AppError, List<Driver>>> getDriversByVehicle(String vehicleId) async{
     try {
      final assign = await remoteDataSource.getDriversByVehicle(vehicleId);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }


  @override
  Future<Either<AppError, List<Driver>>> getSearchedDrivers(String searchTerm) async{
    // 
    try {
      final assign = await remoteDataSource.getSearchedDrivers(searchTerm);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String?>> saveDriver(Map<String, dynamic> body) async{
    // TODO: 
    try {
      final assign = await remoteDataSource.saveDriver(body);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 
}
