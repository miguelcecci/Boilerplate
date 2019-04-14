import 'package:flutter/material.dart';
import 'screens/login/index.dart';

//class Routes {
//  final routes = <String, WidgetBuilder>{
//    '/Login': (BuildContext context) => new Login()
//  };
//
//  Routes() {
//    runApp(new MaterialApp(
//      title: 'Flutter Demo',
//      routes: routes,
//      home: new Login(),
//    ));
//  }
//}

class Routes extends StatelessWidget {

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Boilerplate',
      home: new Login(),
    );
  }
}