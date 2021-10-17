class Driver {
  
  String? title;
  String? companyId;
  String? driverName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? country;
  String? picUrl;
  String? licensed;
  String? licenseUrl;
  String? rating;
  String? driverDocs;
  String? driverId;
  String? vehicle;
  String? assignedDate;

  Driver(
      {this.title,
      this.companyId,
      this.driverName,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.country,
      this.picUrl,
      this.licensed,
      this.licenseUrl,
      this.rating,
      this.driverDocs,
      this.driverId,
      this.vehicle,
      this.assignedDate});

  Driver.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    companyId = json['CompanyId'];
    driverName = json['DriverName'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    city = json['City'];
    country = json['Country'];
    picUrl = json['PicUrl'];
    licensed = json['Licensed'];
    licenseUrl = json['LicenseUrl'];
    rating = json['Rating'];
    driverDocs = json['DriverDocs'];
    driverId = json['DriverId'];
    vehicle = json['Vehicle'];
    assignedDate = json['AssignedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['CompanyId'] = companyId;
    data['DriverName'] = driverName;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Address'] = address;
    data['City'] = city;
    data['Country'] = country;
    data['PicUrl'] = picUrl;
    data['Licensed'] = licensed;
    data['LicenseUrl'] = licenseUrl;
    data['Rating'] = rating;
    data['DriverDocs'] = driverDocs;
    data['DriverId'] = driverId;
    data['Vehicle'] = vehicle;
    data['AssignedDate'] = assignedDate;
    return data;
  }
}
