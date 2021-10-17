class Company {
  String? companyName;
  String? contactEmail;
  String? contactPhone;
  String? address;
  String? country;
  String? companyType;

  Company(
      {this.companyName,
      this.contactEmail,
      this.contactPhone,
      this.address,
      this.country,
      this.companyType});

  Company.fromJson(Map<String, dynamic> json) {
    companyName = json['CompanyName'];
    contactEmail = json['ContactEmail'];
    contactPhone = json['ContactPhone'];
    address = json['Address'];
    country = json['Country'];
    companyType = json['CompanyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CompanyName'] = companyName;
    data['ContactEmail'] = contactEmail;
    data['ContactPhone'] = contactPhone;
    data['Address'] = address;
    data['Country'] = country;
    data['CompanyType'] = companyType;
    return data;
  }
}
