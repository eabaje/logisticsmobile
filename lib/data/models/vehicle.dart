class Vehicle {
 late String vehicleId;
 late  String carrierId;
 late String  vehicleType;
 late String vehicleNumber;
late  String serialNumber;
late  String vehicleMake;
late  String vehicleColor;
late  String vehicleModel;
 late String licensePlate;
late  String vehicleModelYear;
late  String purchaseYear;
late  String insured;
late  String picUrl;
late  String vehicleDocs;
late  String? vehicleNotes;

  Vehicle(
      {
         required  this.vehicleId,
       required  this.carrierId,
      required this.vehicleType,
      required this.vehicleNumber,
      required this.serialNumber,
      required this.vehicleMake,
      required this.vehicleColor,
      required this.vehicleModel,
      required this.licensePlate,
      required this.vehicleModelYear,
      required this.purchaseYear,
      required this.insured,
      required this.picUrl,
      required this.vehicleDocs,
       this.vehicleNotes
      
      });

  Vehicle.fromJson(Map<String, dynamic> json) {

    vehicleId = json['VehicleId'];
    carrierId = json['CarrierId'];
    vehicleType = json['VehicleType'];
    vehicleNumber = json['VehicleNumber'];
    serialNumber = json['SerialNumber'];
    vehicleMake = json['VehicleMake'];
    vehicleColor = json['VehicleColor'];
    vehicleModel = json['VehicleModel'];
    licensePlate = json['LicensePlate'];
    vehicleModelYear = json['VehicleModelYear'];
    purchaseYear = json['PurchaseYear'];
    insured = json['Insured'];
    picUrl = json['PicUrl'];
    vehicleDocs = json['VehicleDocs'];
    vehicleNotes=json['VehicleNotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['VehicleId']=vehicleId;
    data['CarrierId'] = carrierId;
    data['VehicleType'] = vehicleType;
    data['VehicleNumber'] = vehicleNumber;
    data['SerialNumber'] = serialNumber;
    data['VehicleMake'] = vehicleMake;
    data['VehicleColor'] = vehicleColor;
    data['VehicleModel'] = vehicleModel;
    data['LicensePlate'] = licensePlate;
    data['VehicleModelYear'] = vehicleModelYear;
    data['PurchaseYear'] = purchaseYear;
    data['Insured'] = insured;
    data['PicUrl'] = picUrl;
    data['VehicleDocs'] = vehicleDocs;
    data['VehicleNotes'] =vehicleNotes;
    return data;
  }
}
