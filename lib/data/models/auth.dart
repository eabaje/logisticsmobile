class Auth {
	String? firstName;
	String? lastName;
	String? email;
	String? phone;
	String? address;
	String? city;
	String? country;
	String? userPicUrl;
	List<String>? roles;

	Auth({this.firstName, this.lastName, this.email, this.phone, this.address, this.city, this.country, this.userPicUrl, this.roles});

	Auth.fromJson(Map<String, dynamic> json) {
		firstName = json['FirstName'];
		lastName = json['LastName'];
		email = json['Email'];
		phone = json['Phone'];
		address = json['Address'];
		city = json['City'];
		country = json['Country'];
		userPicUrl = json['UserPicUrl'];
		roles = json['roles'];

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['FirstName'] = firstName;
		data['LastName'] = lastName;
		data['Email'] = email;
		data['Phone'] = phone;
		data['Address'] = address;
		data['City'] = city;
		data['Country'] = country;
		data['UserPicUrl'] = userPicUrl;
		data['roles'] = roles;

		return data;
	}
}
