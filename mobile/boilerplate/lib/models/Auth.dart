class Auth{
  final String email;
  final String password;

  Auth({this.email, this.password});


  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      email: json['email'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}