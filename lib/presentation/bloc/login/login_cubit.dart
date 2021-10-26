import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logisticsmobile/data/data_sources/auth_local_data_source.dart';
import 'package:logisticsmobile/data/models/auth.dart';
import 'package:logisticsmobile/domain/repositories/auth_repository.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/error/app_error.dart';
import '../../../domain/entities/login_request_params.dart';
import '../../../domain/entities/no_params.dart';
import '../loading/loading_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final AuthRepository authRepository;
  // final signin loginUser;
  // final LogoutUser logoutUser;
  // // required this.loginUser,
    // required this.logoutUser,
  final LoadingCubit loadingCubit;

  LoginCubit({ required this.authRepository,required this.loadingCubit
  }) : super(LoginInitial());

  void initiateLogin(String username, String password) async {
    loadingCubit.show();
    final Either<AppError, Auth> eitherResponse = await authRepository.signin(username,password);
    

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

 
  void logout() async {
   // await logoutUser(NoParams());
    emit(LogoutSuccess());
  }

 
}
