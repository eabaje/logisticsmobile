class Shipment {
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

  Shipment(
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

  Shipment.fromJson(Map<String, dynamic> json) {
    companyId = json['CompanyId'];
    loadCategory = json['LoadCategory'];
    loadType = json['LoadType'];
    loadWeight = json['LoadWeight'];
    loadUnit = json['LoadUnit'];
    qty = json['Qty'];
    description = json['Description'];
    pickUpLocation = json['PickUpLocation'];
    deliveryLocation = json['DeliveryLocation'];
    pickUpDate = json['PickUpDate'];
    deliveryDate = json['DeliveryDate'];
    shipmentDate = json['ShipmentDate'];
    shipmentDocs = json['ShipmentDocs'];
    shipmentStatus = json['ShipmentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CompanyId'] = companyId;
    data['LoadCategory'] = loadCategory;
    data['LoadType'] = loadType;
    data['LoadWeight'] = loadWeight;
    data['LoadUnit'] = loadUnit;
    data['Qty'] = qty;
    data['Description'] = description;
    data['PickUpLocation'] = pickUpLocation;
    data['DeliveryLocation'] = deliveryLocation;
    data['PickUpDate'] = pickUpDate;
    data['DeliveryDate'] = deliveryDate;
    data['ShipmentDate'] = shipmentDate;
    data['ShipmentDocs'] = shipmentDocs;
    data['ShipmentStatus'] = shipmentStatus;
    return data;
  }
}
