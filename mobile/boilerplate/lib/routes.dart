import 'package:flutter/material.dart';
import 'screens/login/index.dart';
import 'screens/main/index.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Login': (context) => new Login(),
    '/Main' : (context) => new MainScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: 'Boilerplate',
      routes: routes,
      navigatorObservers: [routeObserver],
      home: new MainScreen(),
    ));
  }
}

//class Routes extends StatelessWidget {
//
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Boilerplate',
//      home: new Login(),
//    );
//  }
//}