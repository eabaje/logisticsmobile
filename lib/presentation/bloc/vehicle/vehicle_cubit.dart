import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';
import 'package:logisticsmobile/common/error/app_error.dart';
import 'package:logisticsmobile/domain/repositories/vehicle_repository.dart';
import 'package:logisticsmobile/presentation/bloc/loading/loading_cubit.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final VehicleRepository vehicleRepository;
   //final LoadingCubit loadingCubit;

  VehicleCubit(this.vehicleRepository) : super(InitialVehicleState());

  void getAllVehicles() async {
    emit(LoadingVehicleState());
    var result = await vehicleRepository.getVehicles();
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllVehicleState(errorMessage)),
    //   (listVehicles) => emit(SuccessLoadAllVehicleState(listVehicles)),
    // );

 emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return VehicleErrorMsg(message);
      },
      (listVehicles) => SuccessLoadAllVehicleState(listVehicles),
    )
    );


  }


void getAllVehiclesByVehicleType(String vehicleType) async {
    emit(LoadingVehicleState());
  //  loadingCubit.show();

    var result = await vehicleRepository.getVehiclesByVehicleType(vehicleType);
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllVehicleState(errorMessage)),
    //   (listVehicles) => emit(SuccessLoadAllVehicleState(listVehicles)),
    // );

   emit(result.fold(

      (l) {
      //  var message = getErrorMessage(l.appErrorType);
       // print(message);
        return VehicleError(l.appErrorType);
      },
      (listVehicles) => SuccessLoadAllVehicleState(listVehicles),
    )
    );


  }


 void getAllVehicleById(String vehicleId) async {

    emit(LoadingVehicleState());
    var result = await vehicleRepository.getVehicleById(vehicleId);
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllVehicleState(errorMessage)),
    //   (listVehicle) => emit(SuccessGetVehicleByCriteriaState(listVehicle)),
    // );
 
  emit(result.fold(

      (l) {
       //  var message = getErrorMessage(l.appErrorType);
       // print(message);
        return VehicleError(l.appErrorType);
      },
      (listVehicle) => SuccessGetVehicleByCriteriaState(listVehicle),
    )
    );
 
  }



  void addVehicle(Vehicle vehicleData) async {

    emit(LoadingVehicleState());
    var result = await vehicleRepository.saveVehicle(vehicleData.toJson());
  
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitVehicleState(errorMessage)),
    //   (_) => emit(SuccessSubmitVehicleState()),
    // );



    emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return VehicleErrorMsg(message);
      },
      (_) => SuccessSubmitVehicleState(),
    )
    );



  }

  void editVehicle(Vehicle vehicleData) async {
    emit(LoadingVehicleState());
    var result = await vehicleRepository.editVehicle(vehicleData.toJson());
   
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitVehicleState(errorMessage)),
    //   (_) => emit(SuccessSubmitVehicleState()),
    // );

   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return VehicleErrorMsg(message);
      },
      (_) => SuccessSubmitVehicleState(),
    )
    );



  }

  // void deleteVehicle(int id) async {
  //   emit(LoadingVehicleState());
  //   var resultDelete = await vehicleRepository.deleteVehicle(id);
  //   var resultDeleteFold = resultDelete.fold(
  //     (errorMessage) => errorMessage,
  //     (response) => response,
  //   );
  //   if (resultDeleteFold is String) {
  //     emit(FailureDeleteVehicleState(resultDeleteFold));
  //     return;
  //   }
  //   var resultGetAllVehicles = await dioHelper.getAllVehicles();
  //   resultGetAllVehicles.fold(
  //     (errorMessage) => emit(FailureLoadAllVehicleState(errorMessage)),
  //     (listVehicles) => emit(
  //       SuccessLoadAllVehicleState(
  //         listVehicles,
  //         message: 'Vehicle data deleted successfully',
  //       ),
  //     ),
  //   );
  // }
}