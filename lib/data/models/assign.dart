class Assign {
  String? driverId;
  String? vehicleId;

  Assign({this.driverId, this.vehicleId});

  Assign.fromJson(Map<String, dynamic> json) {
    driverId = json['DriverId'];
    vehicleId = json['VehicleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DriverId'] = driverId;
    data['VehicleId'] = vehicleId;
    return data;
  }
}
