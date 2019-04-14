class User{
  final String email;
  final String username;
  final String token;

  User({this.email, this.token, this.username});


  factory User.fromJson(Map<String, dynamic> json) {
    var aux = json['user'];
    print(aux);
    return User(
      email: aux['email'],
      username: aux['username'],
      token: aux['token'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["username"] = username;
    map["token"] = token;
    return map;
  }
}