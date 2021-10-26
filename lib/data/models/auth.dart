class Auth {
	String? userId;
	String? userName;
  String? password;
	String? email;
	String? accessToken;
	List<String>? roles;
// message: 'Success',
         
	Auth({this.userId, this.userName,this.password, this.email, this.accessToken,  this.roles});

	Auth.fromJson(Map<String, dynamic> json) {
		userId = json['UserId'];
		userName = json['UserName'];
    password = json['Password'];
		email = json['Email'];
		accessToken = json['AccessToken'];
		roles = json['Roles'];

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['UserId'] = userId;
		data['UserName'] = userName;
	  data['Password'] = password;
		data['Email'] = email;
		data['AccessToken'] = accessToken;
		data['Roles'] = roles;

		return data;
	}
}
