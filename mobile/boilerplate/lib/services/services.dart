import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/globals.dart' as globals;
import '../models/User.dart';


Future<User> postLogin({Map body}) async {
  var url = globals.defaultUrl + '/users/login';
  print(url);
  print(body);
  Map<String, String> headers = new Map<String, String>();

  headers["Accept"] = "application/json";
  return http.post(url, body: body, headers: headers).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));
  });
}

//Future<User> postRegister({Map body}) async{
//  var url = globals.defaultUrl + '/users/register';
//}