import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailField,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: passwordField,
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
      ],
    );
  }
}
