import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/data_sources/delivery_remote_data_source.dart';
import 'package:logisticsmobile/data/models/trip.dart';

import 'package:logisticsmobile/domain/repositories/trip_repository.dart';
import '../../common/error/app_error.dart';
import '../data_sources/movie_local_data_source.dart';


//import '../tables/movie_table.dart';

class TripRepositoryImpl extends TripRepository {
  final TripShipmentRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  TripRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, String>> editTrip(Map<String, dynamic> body) async {
     try {
      final trip = await remoteDataSource.editTrip(body);
      return Right(trip);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Trip>> getTripById(String id) async {
    // 
    try {
      final assign = await remoteDataSource.getTripById(id);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 @override
  Future<Either<AppError, Trip>> getTripByShipmentId(String shipmentId) async {
     try {
      final assign = await remoteDataSource.getTripByShipmentId(shipmentId);
      return Right(assign);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }



  @override
  Future<Either<AppError, List<Trip>>> getTrips() async{
    try {
      final trips = await remoteDataSource.getTrips();
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getTripsByVehicle(String vehicleId, String startDate, String endDate) async {
    try {
      final trips = await remoteDataSource.getTripsByVehicle(vehicleId, startDate, endDate);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getfindAllTripsByDeliveryDate(String startDate, String endDate)async {
     try {
      final trips = await remoteDataSource.getfindAllTripsByDeliveryDate(startDate, endDate);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getfindAllTripsByDeliveryLocation(String deliveryLocation) async {
    try {
      final trips = await remoteDataSource.getfindAllTripsByDeliveryLocation(deliveryLocation);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getfindAllTripsByPickUpDate(String startDate, String endDate) async {
     try {
      final trips = await remoteDataSource.getfindAllTripsByPickUpDate(startDate, endDate);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getfindAllTripsByPickUpLocation(String pickUpLocation) async {
     try {
      final trips = await remoteDataSource.getfindAllTripsByPickUpLocation(pickUpLocation);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> saveTrip(Map<String, dynamic> body) async{
   try {
      final trip = await remoteDataSource.editTrip(body);
      return Right(trip);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Trip>>> getTripsByDriver(String driverId, String startDate, String endDate) async {
     try {
      final trips = await remoteDataSource.getTripsByDriver(driverId, startDate, endDate);
      return Right(trips);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 


  

  // @override
  // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
  //   try {
  //     final response = await localDataSource.getMovies();
  //     return Right(response);
  //   } on Exception {
  //     return Left(AppError(AppErrorType.database));
  //   }
  // }

 

  

 
}
