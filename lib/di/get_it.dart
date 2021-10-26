import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logisticsmobile/data/data_sources/auth_local_data_source.dart';
import 'package:logisticsmobile/data/data_sources/auth_remote_data_source.dart';
import 'package:logisticsmobile/data/data_sources/delivery_remote_data_source.dart';
import 'package:logisticsmobile/data/data_sources/driver_vehicle_remote_data_source.dart';
import 'package:logisticsmobile/data/repositories/auth_repository_impl.dart';
import 'package:logisticsmobile/data/repositories/driver_repository_impl.dart';
import 'package:logisticsmobile/data/repositories/shipment_repository_impl.dart';
import 'package:logisticsmobile/data/repositories/trip_repository_impl.dart';
import 'package:logisticsmobile/data/repositories/vehicle_repository_impl.dart';
import 'package:logisticsmobile/domain/repositories/auth_repository.dart';
import 'package:logisticsmobile/domain/repositories/driver_repository.dart';
import 'package:logisticsmobile/domain/repositories/shipment_repository.dart';
import 'package:logisticsmobile/domain/repositories/trip_repository.dart';
import 'package:logisticsmobile/domain/repositories/vehicle_repository.dart';
import 'package:logisticsmobile/domain/usecases/auth/login_user.dart';
import 'package:logisticsmobile/domain/usecases/auth/logout_user.dart';
import 'package:logisticsmobile/domain/usecases/get_preferred_language.dart';
import 'package:logisticsmobile/domain/usecases/get_preferred_theme.dart';
import 'package:logisticsmobile/domain/usecases/update_language.dart';
import 'package:logisticsmobile/domain/usecases/update_theme.dart';
import 'package:logisticsmobile/presentation/bloc/driver/driver_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/language/language_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/loading/loading_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/login/login_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/shipment/shipment_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/theme/theme_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/trip/trip_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/vehicle/vehicle_cubit.dart';


import '../data/core/api_client.dart';

import '../data/data_sources/language_local_data_source.dart';
import '../data/data_sources/movie_local_data_source.dart';

import '../data/repositories/app_repository_impl.dart';


import '../domain/repositories/app_repository.dart';






final getItInstance = GetIt.I;

Future init() async {

//datasources

  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<TripShipmentRemoteDataSource>(
      () => TripShipmentRemoteDataSourceImpl(getItInstance()));


getItInstance.registerLazySingleton<DriverVehicleRemoteDataSource>(
      () => DriverVehicleRemoteDataSourceImpl(getItInstance()));


  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl());



  
 //Repositories

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

  getItInstance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getItInstance(), getItInstance()));

 getItInstance.registerLazySingleton<DriverRepository>(
      () => DriverRepositoryImpl(getItInstance(), getItInstance()));

 getItInstance.registerLazySingleton<VehicleRepository>(
      () => VehicleRepositoryImpl(getItInstance(), getItInstance()));

 getItInstance.registerLazySingleton<ShipmentRepository>(
      () => ShipmentRepositoryImpl(getItInstance(), getItInstance()));

getItInstance.registerLazySingleton<TripRepository>(
      () => TripRepositoryImpl(getItInstance(), getItInstance()));

// use case

 getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<signIn>(() => LoginUser(getItInstance()));

  // getItInstance
  //     .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));



//Blocs-Cubit

getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());


getItInstance.registerFactory(() => DriverCubit(getItInstance(),getItInstance()),);

     


getItInstance.registerLazySingleton(() => ShipmentCubit(getItInstance()));


getItInstance.registerFactory(() => TripCubit(getItInstance()));


getItInstance.registerFactory(() => VehicleCubit(getItInstance()));


getItInstance.registerFactory(() => LoginCubit(
        // loginUser: getItInstance(),
        // logoutUser: getItInstance(),
        loadingCubit: getItInstance(), authRepository: getItInstance(),
      ));



getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));

getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

 
}
