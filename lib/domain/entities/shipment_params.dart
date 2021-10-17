class ShipmentRequestParams {
  String? companyId;
  String? loadCategory;
  String? loadType;
  String? loadWeight;
  String? loadUnit;
  String? qty;
  String? description;
  String? pickUpLocation;
  String? deliveryLocation;
  String? pickUpDate;
  String? deliveryDate;
  String? shipmentDate;
  String? shipmentDocs;
  String? shipmentStatus;

  ShipmentRequestParams(
      {this.companyId,
      this.loadCategory,
      this.loadType,
      this.loadWeight,
      this.loadUnit,
      this.qty,
      this.description,
      this.pickUpLocation,
      this.deliveryLocation,
      this.pickUpDate,
      this.deliveryDate,
      this.shipmentDate,
      this.shipmentDocs,
      this.shipmentStatus});

  

  Map<String, dynamic> toJson() => {
   
    'CompanyId' : companyId,
    'LoadCategory' : loadCategory,
    'LoadType' : loadType,
    'LoadWeight' : loadWeight,
    'LoadUnit' : loadUnit,
    'Qty' : qty,
    'Description' : description,
    'PickUpLocation' : pickUpLocation,
    'DeliveryLocation' : deliveryLocation,
    'PickUpDate' : pickUpDate,
    'DeliveryDate' : deliveryDate,
    'ShipmentDate' : shipmentDate,
    'ShipmentDocs' : shipmentDocs,
    'ShipmentStatus' : shipmentStatus,
   
  };
}
