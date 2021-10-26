import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/auth.dart';

import '../../common/error/app_error.dart';
import '../../domain/repositories/auth_repository.dart';
import '../core/unathorised_exception.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/request_token_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
  );

  
  @override
  Future<Either<AppError, Auth>> signin(String username,String password) async {
     try {
      final response = await _authRemoteDataSource.signIn(username, password);
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> signup(Map<String, dynamic> params) async {
    try {
      final response = await _authRemoteDataSource.signUp(params);
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }



}
