import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logisticsmobile/data/models/trip.dart';
import 'package:logisticsmobile/common/error/app_error.dart';
import 'package:logisticsmobile/domain/repositories/trip_repository.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final TripRepository tripRepository;

  TripCubit(this.tripRepository) : super(InitialTripState());

  void getAllTrips() async {
    emit(LoadingTripState());
    var result = await tripRepository.getTrips();
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );

  
   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );


  }

void getAllTripsAssigned(String vehicleId,String startDate,String endDate) async {
    emit(LoadingTripState());
    var result = await tripRepository.getTripsByVehicle(vehicleId, startDate, endDate);
  
  
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );




  }

  void getAllTripsByDeliveryDate(String startDate,String toDate ) async {
    emit(LoadingTripState());
    var result = await tripRepository.getfindAllTripsByDeliveryDate(startDate, toDate);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );


  }
 void getAllTripsByPickUpDate(String startDate,String endDate ) async {
    emit(LoadingTripState());
    var result = await tripRepository.getfindAllTripsByPickUpDate(startDate, endDate);
    
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );




  }

  void getAllTripsByDeliveryLocation(String deliveryLocation ) async {
    emit(LoadingTripState());
    var result = await tripRepository.getfindAllTripsByDeliveryLocation(deliveryLocation);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );



  }

void getAllTripsByPickUpLocation(String pickUpLocation) async {
    emit(LoadingTripState());
    var result = await tripRepository.getfindAllTripsByPickUpLocation(pickUpLocation);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );





  }

  void getAllTripsByDriver(String driverId,String startDate,String endDate) async {
    emit(LoadingTripState());
    var result = await tripRepository.getTripsByDriver(driverId, startDate, endDate);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrips) => emit(SuccessLoadAllTripState(listTrips)),
    // );


     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrips) => SuccessLoadAllTripState(listTrips),
    )
    );



  }


 void getTripById(String tripId) async {
    emit(LoadingTripState());
    var result = await tripRepository.getTripById(tripId);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrip) => emit(SuccessGetTripByCriteriaState(listTrip)),
    // );


   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrip) => SuccessGetTripByCriteriaState(listTrip),
    )
    );



  }

  void getTripByShipmentId(String shipmentId) async {
    emit(LoadingTripState());
    var result = await tripRepository.getTripByShipmentId(shipmentId);
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
    //   (listTrip) => emit(SuccessGetTripByCriteriaState(listTrip)),
    // );


   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (listTrip) => SuccessGetTripByCriteriaState(listTrip),
    )
    );


  }

  void addTrip(Trip tripData) async {
    emit(LoadingTripState());
    var result = await tripRepository.saveTrip(tripData.toJson());
   
   
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitTripState(errorMessage)),
    //   (_) => emit(SuccessSubmitTripState()),
    // );


   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (_) => SuccessSubmitTripState(),
    )
    );

  }

  void editTrip(Trip tripData) async {
    emit(LoadingTripState());
    var result = await tripRepository.editTrip(tripData.toJson());
  
  
  
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitTripState(errorMessage)),
    //   (_) => emit(SuccessSubmitTripState()),
    // );


      emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return TripError(message);
      },
      (_) => SuccessSubmitTripState(),
    )
    );




  }

  // void deleteTrip(int id) async {
  //   emit(LoadingTripState());
  //   var resultDelete = await tripRepository.deleteTrip(id);
  //   var resultDeleteFold = resultDelete.fold(
  //     (errorMessage) => errorMessage,
  //     (response) => response,
  //   );
  //   if (resultDeleteFold is String) {
  //     emit(FailureDeleteTripState(resultDeleteFold));
  //     return;
  //   }
  //   var resultGetAllTrips = await dioHelper.getAllTrips();
  //   resultGetAllTrips.fold(
  //     (errorMessage) => emit(FailureLoadAllTripState(errorMessage)),
  //     (listTrips) => emit(
  //       SuccessLoadAllTripState(
  //         listTrips,
  //         message: 'Trip data deleted successfully',
  //       ),
  //     ),
  //   );
  // }
}