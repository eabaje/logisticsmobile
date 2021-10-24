part of 'driver_cubit.dart';

abstract class DriverState extends Equatable {
  const DriverState();

  @override
  List<Object> get props => [];
}



class DriverError extends DriverState {

 final String message;

  DriverError(this.message);

  @override
  List<Object> get props => [message];




}


class InitialDriverState extends DriverState {}

class LoadingDriverState extends DriverState {}

class FailureLoadAllDriverState extends DriverState {
  final AppError errorMessage;

  FailureLoadAllDriverState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadAllDriverState{errorMessage: $errorMessage}';
  }
}

class SuccessLoadAllDriverState extends DriverState {
  final List<Driver> listDrivers;
  //final String message;

  const SuccessLoadAllDriverState(this.listDrivers);

  @override
  String toString() {
    return 'SuccessLoadAllDriverState{listDrivers: $listDrivers}';
  }
}

class SuccessGetDriverByCriteriaState extends DriverState {
  final Driver listDriver;
  //final String message;

  const SuccessGetDriverByCriteriaState(this.listDriver);

  @override
  String toString() {
    return 'SuccessGetDriverByCriteriaState{listDrivers: $listDriver}';
  }
}

class FailureSubmitDriverState extends DriverState {
  final AppError errorMessage;

  FailureSubmitDriverState(this.errorMessage);

  @override
  String toString() {
    return 'FailureSubmitDriverState{errorMessage: $errorMessage}';
  }
}

class SuccessSubmitDriverState extends DriverState {}

class FailureDeleteDriverState extends DriverState {
  final String errorMessage;

  FailureDeleteDriverState(this.errorMessage);

  @override
  String toString() {
    return 'FailureDeleteDriverState{errorMessage: $errorMessage}';
  }
}