import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/data_sources/user_remote_data_source.dart';
import 'package:logisticsmobile/data/models/subscribe.dart';
import 'package:logisticsmobile/data/models/user.dart';
import 'package:logisticsmobile/domain/repositories/user_repository.dart';

import '../../common/error/app_error.dart';
import '../../domain/repositories/auth_repository.dart';
import '../core/unathorised_exception.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';


class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  

  UserRepositoryImpl(
    this._userRemoteDataSource
   
  );

  @override
  Future<Either<AppError, void>> editUser(Map<String, dynamic> body) async{
    try {
      final result = await _userRemoteDataSource.editUser(body);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<User>>> getSearchedUsers(String searchTerm) async {
    try {
      final result = await _userRemoteDataSource.getSearchedUsers(searchTerm);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, User>> getUserById(String id) async {
  try {
      final result = await _userRemoteDataSource.getUserById(id);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<User>>> getUsers()async {
    try {
      final result = await _userRemoteDataSource.getUsers();
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> saveUser(Map<String, dynamic> body) async {
    try {
      final result = await _userRemoteDataSource.saveUser(body);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<UserSubscription>>> findAllUserSubscriptionsByDate(String startDate, String endDate) async {
   try {
      final result = await _userRemoteDataSource.findAllUserSubscriptionsByDate(startDate, endDate);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, UserSubscription>> findUserSubscription(String id) async {
   try {
      final result = await _userRemoteDataSource.findUserSubscription(id);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> updateUserSubscription(Map<String, dynamic> requestBody) async {
   try {
      final result = await _userRemoteDataSource.updateUserSubscription(requestBody);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> upgradeUserSubscription(Map<String, dynamic> requestBody) async {
   try {
      final result = await _userRemoteDataSource.upgradeUserSubscription(requestBody);
      return Right(result);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }







}