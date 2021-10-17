import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/data_sources/delivery_remote_data_source.dart';
import 'package:logisticsmobile/data/models/shipment.dart';
import 'package:logisticsmobile/domain/repositories/shipment_repository.dart';
import '../../domain/entities/app_error.dart';
import '../data_sources/movie_local_data_source.dart';


//import '../tables/movie_table.dart';

class ShipmentRepositoryImpl extends ShipmentRepository {
  final TripShipmentRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  ShipmentRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, String>> editShipment(Map<String, dynamic> requestBody) async {
      try {
      final shipment = await remoteDataSource.editShipment(requestBody);
      return Right(shipment);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Shipment>>> findAllShipmentsByDeliveryDate(String fromDate, String toDate)async {
      try {
      final result = await remoteDataSource.findAllShipmentsByDeliveryDate(fromDate, toDate);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Shipment>>> findAllShipmentsByPickUpDate(String fromDate, String toDate) async {
   try {
      final result = await remoteDataSource.findAllShipmentsByPickUpDate(fromDate, toDate);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Shipment>>> findAllShipmentsByStatus(String shipmentId, String shipmentStaus) async {
   try {
      final result = await remoteDataSource.findAllShipmentsByStatus(shipmentId, shipmentStaus);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Shipment>>> getShipments() async {
   try {
      final result = await remoteDataSource.getShipments();
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Shipment>> getShipmentyId(String id) async {
    try {
      final result = await remoteDataSource.getShipmentyId(id);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> saveShipment(Map<String, dynamic> requestBody) async {
   try {
      final result = await remoteDataSource.saveShipment(requestBody);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<Shipment>>> findAllShipmentsAssigned(String shipmentId, bool assignedShipment) async {
    try {
      final result = await remoteDataSource.findAllShipmentsAssigned(shipmentId, assignedShipment);
      return Right(result);
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
