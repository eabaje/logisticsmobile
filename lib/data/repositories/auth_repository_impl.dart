import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
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

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 = requestTokenEitherResponse
        .getOrElse(() => RequestTokenModel())
        .requestToken;

    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await _authRemoteDataSource.validateWithLogin(body);
      final sessionId = await _authRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      if (sessionId != null) {
        await _authLocalDataSource.saveSessionId(sessionId);
        return const Right(true);
      }
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authLocalDataSource.getSessionId();
    if (sessionId != null) {
      await Future.wait([
        _authRemoteDataSource.deleteSession(sessionId),
        _authLocalDataSource.deleteSessionId(),
      ]);
    }
  //  print(await _authLocalDataSource.getSessionId());
    return Right(Unit);
  }
}
