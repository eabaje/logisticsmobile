import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/common/error/app_error.dart';
import 'package:logisticsmobile/domain/entities/login_request_params.dart';
import 'package:logisticsmobile/domain/repositories/auth_repository.dart';
import '../usecase.dart';


// class LoginUser extends UseCase<bool, LoginRequestParams> {
//   final AuthRepository _authenticationRepository;

//   LoginUser(this._authenticationRepository);

//   @override
//   Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
//       _authenticationRepository.loginUser(params.toJson());
// }
