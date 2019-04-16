import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final emailField = TextEditingController();
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  final passwordConfirmationField = TextEditingController();

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
          controller: usernameField,
          decoration: InputDecoration(hintText: 'Username'),
          obscureText: true,
        ),
        TextField(
          controller: passwordField,
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        TextField(
          controller: passwordConfirmationField,
          decoration: InputDecoration(hintText: 'Confirm Password'),
          obscureText: true,
        ),
      ],
    );
  }
}
