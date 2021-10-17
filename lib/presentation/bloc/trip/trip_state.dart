part of 'trip_cubit.dart';

abstract class TripState extends Equatable {
  const TripState();

  @override
  List<Object> get props => [];
}



class TripError extends TripState {}


class InitialTripState extends TripState {}

class LoadingTripState extends TripState {}

class FailureLoadAllTripState extends TripState {
  final AppError errorMessage;

  FailureLoadAllTripState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadAllTripState{errorMessage: $errorMessage}';
  }
}

class SuccessLoadAllTripState extends TripState {
  final List<Trip> listTrips;
  //final String message;

  const SuccessLoadAllTripState(this.listTrips);

  @override
  String toString() {
    return 'SuccessLoadAllTripState{listTrips: $listTrips}';
  }
}

class SuccessGetTripByCriteriaState extends TripState {
  final Trip listTrip;
  //final String message;

  const SuccessGetTripByCriteriaState(this.listTrip);

  @override
  String toString() {
    return 'SuccessGetTripByCriteriaState{listTrips: $listTrip}';
  }
}

class FailureSubmitTripState extends TripState {
  final AppError errorMessage;

  FailureSubmitTripState(this.errorMessage);

  @override
  String toString() {
    return 'FailureSubmitTripState{errorMessage: $errorMessage}';
  }
}

class SuccessSubmitTripState extends TripState {}

class FailureDeleteTripState extends TripState {
  final String errorMessage;

  FailureDeleteTripState(this.errorMessage);

  @override
  String toString() {
    return 'FailureDeleteTripState{errorMessage: $errorMessage}';
  }
}
