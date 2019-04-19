import 'package:flutter/material.dart';
import '../../models/User.dart';
import '../../util/user.dart';
import '../../routes.dart';
import '../../data/globals.dart' as globals;

class MainScreen extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen> with RouteAware{

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    routeObserver.subscribe(this, ModalRoute.of(context));
//  }
//
//  @override
//  void dispose() {
//    routeObserver.unsubscribe(this);
//    super.dispose();
//  }

//  @override
//  void didPopNext(){
//    retrieveUserFromLocal().then((val){
//      setState(() {
//        this.user = val;
//      });
//    });
//  }

  @override
  void initState() {
    bool a = true;
    verifyLoggedUser().then((val){
      a = val;
      if(!a){
        Navigator.pushNamed(context, '/Login');
      }
      else{
        retrieveUserFromLocal().then((val){
          setState(() {
            globals.user = val;
          });
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:Center(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(globals.user.email),
              Text(globals.user.username),
              RaisedButton(
                onPressed: (){
                  removeUserFromLocal();
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text('Logout'),
              )
            ]
        )
      )
    );
  }
}

