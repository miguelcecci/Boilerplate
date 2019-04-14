class Register{
  final String email;
  final String username;
  final String password;

  Register({this.email, this.username, this.password});


  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      email: json['email'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}