import 'package:flutter/material.dart';
import '../../models/User.dart';
import '../../models/Auth.dart';
import '../../services/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  bool activityIndicator = false;

  void _changeActivityIndicator() {
    setState(() {
      activityIndicator = !activityIndicator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: 150.0,
                  ),
                  Text(
                    'Boilerplate',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.indigo,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
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
              ),
              RaisedButton(
                  onPressed: () async {
                    _changeActivityIndicator();
                    User user = await postLogin(
                        body: Auth(
                            email: emailField.text,
                            password: passwordField.text)
                            .toMap());
                    _changeActivityIndicator();
                    print(user.toMap());
                  },
                  textColor: Colors.white,
                  color: Theme.of(context).accentColor,
                  child: Text('Login')),
              RaisedButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0.0),
                  child: Text('Register')
              ),
              Visibility(
                  visible: activityIndicator,
                  child: CircularProgressIndicator()),
            ],
          ),
        ));
  }
}
