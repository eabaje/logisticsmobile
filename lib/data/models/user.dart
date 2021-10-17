class User {
  String? userId;
  String? companyId;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? country;
  String? userName;
  String? password;
  String? userPicUrl;
  String? token;
  bool? isActivated;
  String? loginType;
  String? createdAt;
  String? updatedAt;

  User({
      required this.userId,
      this.companyId,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.country,
      this.userName,
      this.password,
      this.userPicUrl,
      this.token,
      this.isActivated =false,
      this.loginType,
      this.createdAt,
      this.updatedAt
      });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'] ;
    companyId = json['CompanyId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    fullName = json['FullName'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    city = json['City'];
    country = json['Country'];
    userName = json['UserName'];
    password = json['Password'];
    userPicUrl = json['UserPicUrl'];
    token = json['Token'];
    isActivated = json['IsActivated'];
    loginType = json['LoginType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['CompanyId'] = companyId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['FullName'] = fullName;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Address'] = address;
    data['City'] = city;
    data['Country'] = country;
    data['UserName'] = userName;
    data['Password'] = password;
    data['UserPicUrl'] = userPicUrl;
    data['Token'] = token;
    data['IsActivated'] = isActivated;
    data['LoginType'] = loginType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
