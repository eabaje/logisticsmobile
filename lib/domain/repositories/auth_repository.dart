import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/auth.dart';

import '../../common/error/app_error.dart';

abstract class AuthRepository {
  // Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params);
  // Future<Either<AppError, void>> logoutUser();

   Future<Either<AppError, Auth>> signin(String username,String password);

  Future<Either<AppError, String>> signup(Map<String, dynamic> params);
}
