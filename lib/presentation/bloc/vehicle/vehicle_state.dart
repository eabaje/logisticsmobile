part of 'vehicle_cubit.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

 

class VehicleError extends VehicleState {

final AppErrorType errorType;

  VehicleError(this.errorType);

  @override
  List<Object> get props => [errorType];


  
}

class VehicleErrorMsg extends VehicleState {

final String message;

  VehicleErrorMsg(this.message);

  @override
  List<Object> get props => [message];


  
}


class InitialVehicleState extends VehicleState {}

class LoadingVehicleState extends VehicleState {}

class FailureLoadAllVehicleState extends VehicleState {
  final AppError errorMessage;

  FailureLoadAllVehicleState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadAllVehicleState{errorMessage: $errorMessage}';
  }
}

class SuccessLoadAllVehicleState extends VehicleState {
  final List<Vehicle> listVehicles;
  //final String message;

  const SuccessLoadAllVehicleState(this.listVehicles);

  @override
  String toString() {
    return 'SuccessLoadAllVehicleState{listVehicles: $listVehicles}';
  }
}

class SuccessGetVehicleByCriteriaState extends VehicleState {
  final Vehicle listVehicle;
  //final String message;

  const SuccessGetVehicleByCriteriaState(this.listVehicle);

  @override
  String toString() {
    return 'SuccessGetVehicleByCriteriaState{listVehicles: $listVehicle}';
  }
}

class FailureSubmitVehicleState extends VehicleState {
  final AppError errorMessage;

  FailureSubmitVehicleState(this.errorMessage);

  @override
  String toString() {
    return 'FailureSubmitVehicleState{errorMessage: $errorMessage}';
  }
}

class SuccessSubmitVehicleState extends VehicleState {}

class FailureDeleteVehicleState extends VehicleState {
  final String errorMessage;

  FailureDeleteVehicleState(this.errorMessage);

  @override
  String toString() {
    return 'FailureDeleteVehicleState{errorMessage: $errorMessage}';
  }
}