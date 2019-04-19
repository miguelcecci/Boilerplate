import '../models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

storeUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('token', user.token);
  prefs.setString('email', user.email);
  prefs.setString('username', user.username);

}

Future<bool> verifyLoggedUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final token = prefs.getString('token') ?? null;
  if(token == null){
    return false;
  }
  return true;
}

Future <User> retrieveUserFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final token = prefs.getString('token');
  final email = prefs.getString('email');
  final username = prefs.getString('username');

  return User(email: email, token: token, username: username);
}

removeUserFromLocal() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('email');
  prefs.remove('username');
}