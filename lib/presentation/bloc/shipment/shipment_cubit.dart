import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logisticsmobile/data/models/shipment.dart';
import 'package:logisticsmobile/common/error/app_error.dart';
import 'package:logisticsmobile/domain/repositories/shipment_repository.dart';

part 'shipment_state.dart';




class ShipmentCubit extends Cubit<ShipmentState> {
  final ShipmentRepository shipmentRepository;

  ShipmentCubit(this.shipmentRepository) : super(InitialShipmentState());

  void getAllShipments() async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.getShipments();

    
    emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipments) => SuccessLoadAllShipmentState(listShipments),
    )
    );
  }

void getAllShipmentsAssigned(String shipmentId,bool assignedShipment ) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.findAllShipmentsAssigned(shipmentId, assignedShipment);
    emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipments) => SuccessLoadAllShipmentState(listShipments),
    )
    );
  }

  void getAllShipmentsByDeliveryDate(String fromDate,String toDate ) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.findAllShipmentsByDeliveryDate(fromDate, toDate);
    emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipments) => SuccessLoadAllShipmentState(listShipments),
    )
    );
  }
 void getAllShipmentsByPickUpDate(String fromDate,String toDate ) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.findAllShipmentsByPickUpDate(fromDate, toDate);
   emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipments) => SuccessLoadAllShipmentState(listShipments),
    )
    );
  }
void getAllShipmentsByStatus(String shipmentId,String shipmentStatus ) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.findAllShipmentsByStatus(shipmentId, shipmentStatus);
    emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipments) => SuccessLoadAllShipmentState(listShipments),
    )
    );
  }
 void getAllShipmentById(String shipmentId) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.getShipmentyId(shipmentId);
    
    // result.fold(
     
    //   (errorMessage) => emit(FailureLoadAllShipmentState(errorMessage)),
    //   (listShipment) => emit(SuccessGetShipmentByCriteriaState(listShipment)),
    // );

     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      ( listShipment) => SuccessGetShipmentByCriteriaState(listShipment),
    )
    );


  }

  void addShipment(Shipment shipmentData) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.saveShipment(shipmentData.toJson());
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitShipmentState(errorMessage)),
    //   (_) => emit(SuccessSubmitShipmentState()),
    // );

     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      (_) => SuccessSubmitShipmentState(),
    )
    );

  }

  void editShipment(Shipment shipmentData) async {
    emit(LoadingShipmentState());
    var result = await shipmentRepository.editShipment(shipmentData.toJson());
    
    // result.fold(
    //   (errorMessage) => emit(FailureSubmitShipmentState(errorMessage)),
    //   (_) => emit(SuccessSubmitShipmentState()),
    // );


     emit(result.fold(

      (l) {
        var message = getErrorMessage(l.appErrorType);
       // print(message);
        return ShipmentError(message);
      },
      (_) => SuccessSubmitShipmentState(),
    )
    );


  }

  // void deleteShipment(int id) async {
  //   emit(LoadingShipmentState());
  //   var resultDelete = await shipmentRepository.deleteShipment(id);
  //   var resultDeleteFold = resultDelete.fold(
  //     (errorMessage) => errorMessage,
  //     (response) => response,
  //   );
  //   if (resultDeleteFold is String) {
  //     emit(FailureDeleteShipmentState(resultDeleteFold));
  //     return;
  //   }
  //   var resultGetAllShipments = await dioHelper.getAllShipments();
  //   resultGetAllShipments.fold(
  //     (errorMessage) => emit(FailureLoadAllShipmentState(errorMessage)),
  //     (listShipments) => emit(
  //       SuccessLoadAllShipmentState(
  //         listShipments,
  //         message: 'Shipment data deleted successfully',
  //       ),
  //     ),
  //   );
  // }
}