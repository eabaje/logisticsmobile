part of 'shipment_cubit.dart';

abstract class ShipmentState extends Equatable {
  const ShipmentState();

  @override
  List<Object> get props => [];
}



class ShipmentError extends ShipmentState {

 final String message;

  ShipmentError(this.message);

  @override
  List<Object> get props => [message];



}


class InitialShipmentState extends ShipmentState {}

class LoadingShipmentState extends ShipmentState {}

class FailureLoadAllShipmentState extends ShipmentState {
  final AppError errorMessage;

  FailureLoadAllShipmentState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadAllShipmentState{errorMessage: $errorMessage}';
  }
}

class SuccessLoadAllShipmentState extends ShipmentState {
  final List<Shipment> listShipments;
  //final String message;

  const SuccessLoadAllShipmentState(this.listShipments);

  @override
  String toString() {
    return 'SuccessLoadAllShipmentState{listShipments: $listShipments}';
  }
}

class SuccessGetShipmentByCriteriaState extends ShipmentState {
  final Shipment listShipment;
  //final String message;

  const SuccessGetShipmentByCriteriaState(this.listShipment);

  @override
  String toString() {
    return 'SuccessGetShipmentByCriteriaState{listShipments: $listShipment}';
  }
}

class FailureSubmitShipmentState extends ShipmentState {
  final AppError errorMessage;

  FailureSubmitShipmentState(this.errorMessage);

  @override
  String toString() {
    return 'FailureSubmitShipmentState{errorMessage: $errorMessage}';
  }
}

class SuccessSubmitShipmentState extends ShipmentState {}

class FailureDeleteShipmentState extends ShipmentState {
  final String errorMessage;

  FailureDeleteShipmentState(this.errorMessage);

  @override
  String toString() {
    return 'FailureDeleteShipmentState{errorMessage: $errorMessage}';
  }
}