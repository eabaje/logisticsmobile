class Trip {
  late String tripId;
  String? trackId;
  String? vehicleId;
  String? driverId;
  String? pickUpLocation;
  String? deliveryLocation;
  String? pickUpDate;
  String? deliveryDate;
  String? driverNote;
  String? shipmentId;

  Trip(
      {
       required  this.tripId,
        this.trackId,
      this.vehicleId,
      this.driverId,
      this.pickUpLocation,
      this.deliveryLocation,
      this.pickUpDate,
      this.deliveryDate,
      this.driverNote,
      this.shipmentId});

  Trip.fromJson(Map<String, dynamic> json) {

    tripId = json['TripId'];
    trackId = json['TrackId'];
    vehicleId = json['VehicleId'];
    driverId = json['DriverId'];
    pickUpLocation = json['PickUpLocation'];
    deliveryLocation = json['DeliveryLocation'];
    pickUpDate = json['PickUpDate'];
    deliveryDate = json['DeliveryDate'];
    driverNote = json['DriverNote'];
    shipmentId = json['ShipmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
     data['TripId'] = tripId;
    data['TrackId'] = trackId;
    data['VehicleId'] = vehicleId;
    data['DriverId'] = driverId;
    data['PickUpLocation'] = pickUpLocation;
    data['DeliveryLocation'] = deliveryLocation;
    data['PickUpDate'] = pickUpDate;
    data['DeliveryDate'] = deliveryDate;
    data['DriverNote'] = driverNote;
    data['ShipmentId'] = shipmentId;
    return data;
  }
}
