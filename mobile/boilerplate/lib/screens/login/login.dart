import 'package:flutter/material.dart';

class Login extends StatelessWidget {
//  String email = '';
//  String password = '';

  @override
  Widget build(BuildContext context){
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
                  Text('Boilerplate', style: TextStyle(fontSize: 28, color: Colors.indigo, fontStyle: FontStyle.italic),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
              RaisedButton(onPressed: () {}, child: Text('Login')),
              CircularProgressIndicator(),
            ],
          ),
        ));
  }

}