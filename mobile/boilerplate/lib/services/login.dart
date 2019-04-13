import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/globals.dart' as globals;

class PostLogin{
  final String email;
  final String password;

  PostLogin({this.email, this.password});


  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
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

Future<PostLogin> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return PostLogin.fromJson(json.decode(response.body));
  });
}