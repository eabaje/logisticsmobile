import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logisticsmobile/domain/usecases/auth/login_user.dart';
import 'package:logisticsmobile/domain/usecases/auth/logout_user.dart';

import '../../../common/constants/translation_constants.dart';
import '../../../common/error/app_error.dart';
import '../../../domain/entities/login_request_params.dart';
import '../../../domain/entities/no_params.dart';
import '../loading/loading_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingCubit loadingCubit;

  LoginCubit({
    required this.loginUser,
    required this.logoutUser,
    required this.loadingCubit,
  }) : super(LoginInitial());

  void initiateLogin(String username, String password) async {
    loadingCubit.show();
    final Either<AppError, bool> eitherResponse = await loginUser(
      LoginRequestParams(
        userName: username,
        password: password,
      ),
    );

    emit(eitherResponse.fold(
      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return LoginError(message);
      },
      (r) => LoginSuccess(),
    ));
    loadingCubit.hide();
  }

  void initiateGuestLogin() async {
    emit(LoginSuccess());
  }

  void logout() async {
    await logoutUser(NoParams());
    emit(LogoutSuccess());
  }

 
}
