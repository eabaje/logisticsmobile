import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';
import 'package:logisticsmobile/domain/repositories/vehicle_repository.dart';
import '../../common/error/app_error.dart';
import '../data_sources/movie_local_data_source.dart';
import '../data_sources/driver_vehicle_remote_data_source.dart';

//import '../tables/movie_table.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final DriverVehicleRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  VehicleRepositoryImpl(this.remoteDataSource, this.localDataSource);


  

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
  Future<Either<AppError, List<Vehicle>>> getVehicles() async {
    try {
      final vehicles = await remoteDataSource.getVehicles();
      return Right(vehicles);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

@override
  Future<Either<AppError, Vehicle>> getVehicleById(String id) async{
    try {
      final vehicle = await remoteDataSource.getVehicleById(id);
      return Right(vehicle);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }



  

 @override
  Future<Either<AppError, String>> saveVehicle(Map<String, dynamic> body) async{
    
     try {
      final vehicle = await remoteDataSource.saveVehicle(body);
      return Right(vehicle);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }


  @override
  Future<Either<AppError, String>> editVehicle(Map<String, dynamic> body) async {
    //
      try {
      final vehicle = await remoteDataSource.editVehicle(body);
      return Right(vehicle);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Vehicle>>> getVehiclesByVehicleType(String vehicleType) async {
   try {
      final vehicle = await remoteDataSource.getVehiclesByVehicleType(vehicleType);
      return Right(vehicle);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  


 
}
