import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logisticsmobile/data/models/driver.dart';
import 'package:logisticsmobile/domain/entities/app_error.dart';
import 'package:logisticsmobile/domain/repositories/driver_repository.dart';
import 'package:logisticsmobile/presentation/bloc/loading/loading_cubit.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  final DriverRepository driverRepository;
  final LoadingCubit loadingCubit;

  DriverCubit(this.driverRepository,this.loadingCubit) : super(InitialDriverState());

  void getAllDrivers() async {
   // emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.getDrivers();
    result.fold(
      (errorMessage) => emit(FailureLoadAllDriverState(errorMessage)),
      (listDrivers) => emit(SuccessLoadAllDriverState(listDrivers)),
    );
      loadingCubit.hide();
  }

void getDriverById(String driverId) async {
   // emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.getDriverById(driverId);
    result.fold(
      (errorMessage) => emit(FailureLoadAllDriverState(errorMessage)),
      (listDriver) => emit(SuccessGetDriverByCriteriaState(listDriver)),
    );
     loadingCubit.hide();
  }

  void getAllDriversBySearch(String searchTerm ) async {
  //  emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.getSearchedDrivers(searchTerm);
    result.fold(
      (errorMessage) => emit(FailureLoadAllDriverState(errorMessage)),
      (listDrivers) => emit(SuccessLoadAllDriverState(listDrivers)),
    );
     loadingCubit.hide();
  }
 void assignDriverToVehicle(Driver driver ) async {
   // emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.assignDriverToVehicle(driver.toJson());
    result.fold(
      (errorMessage) => emit(FailureSubmitDriverState(errorMessage)),
      (_) => emit(SuccessSubmitDriverState()),
    );
     loadingCubit.hide();
  }


  void addDriver(Driver driverData) async {
   // emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.saveDriver(driverData.toJson());
    result.fold(
      (errorMessage) => emit(FailureSubmitDriverState(errorMessage)),
      (_) => emit(SuccessSubmitDriverState()),
    );
     loadingCubit.hide();
  }

  void editDriver(Driver driverData) async {
   // emit(LoadingDriverState());
     loadingCubit.show();
    var result = await driverRepository.editDriver(driverData.toJson());
    result.fold(
      (errorMessage) => emit(FailureSubmitDriverState(errorMessage)),
      (_) => emit(SuccessSubmitDriverState()),
    );
     loadingCubit.hide();
  }

  // void deleteDriver(int id) async {
  //   emit(LoadingDriverState());
  //   var resultDelete = await driverRepository.deleteDriver(id);
  //   var resultDeleteFold = resultDelete.fold(
  //     (errorMessage) => errorMessage,
  //     (response) => response,
  //   );
  //   if (resultDeleteFold is String) {
  //     emit(FailureDeleteDriverState(resultDeleteFold));
  //     return;
  //   }
  //   var resultGetAllDrivers = await dioHelper.getAllDrivers();
  //   resultGetAllDrivers.fold(
  //     (errorMessage) => emit(FailureLoadAllDriverState(errorMessage)),
  //     (listDrivers) => emit(
  //       SuccessLoadAllDriverState(
  //         listDrivers,
  //         message: 'Driver data deleted successfully',
  //       ),
  //     ),
  //   );
  // }
}
