import 'package:flutter/material.dart';
import '../../models/User.dart';
import '../../models/Auth.dart';
import '../../models/ResponseStatus.dart';
import '../../services/services.dart';
import '../../widgets/forms/register.dart';
import '../../widgets/forms/login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//  final emailField = TextEditingController();
//  final passwordField = TextEditingController();
  bool activityIndicator = false;
  bool showLoginForm = true;
  int logoSize = 150;
  int fontSizeLogo = 28;
  String button1value = 'Login';
  String button2value = 'Register';
  String statusMessage = '';
  LoginForm loginForm = new LoginForm();
  RegisterForm registerForm = new RegisterForm();


  void _changeActivityIndicator() {
    setState(() {
      activityIndicator = !activityIndicator;
    });
  }

  void _toggleLoginRegister(){
    setState(() {
      showLoginForm = !showLoginForm;
      statusMessage = '';
      if(showLoginForm){
        logoSize = 150;
        fontSizeLogo = 28;
        button1value = 'Login';
        button2value = 'Register';
      }else{
        logoSize = 100;
        fontSizeLogo = 22;
        button1value = 'Submit';
        button2value = 'Back';
      }
    });
  }

  Widget _buildLoginRegister(){
    if(showLoginForm){
      return loginForm;
    }
    return registerForm;
  }

  void _setStatusMessage(String status){
    setState(() {
      statusMessage = status;
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
                    size: logoSize.toDouble(),
                  ),
                  Text(
                    'Boilerplate',
                    style: TextStyle(
                        fontSize: fontSizeLogo.toDouble(),
                        color: Colors.indigo,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              _buildLoginRegister(),
              Text(statusMessage),
              RaisedButton(
                  onPressed: () async {
                    _setStatusMessage('');
                    _changeActivityIndicator();
                    if(showLoginForm) {
                      if(loginForm.passwordField.text == '' || loginForm.emailField.text == ''){
                        _setStatusMessage('Email or Password Field is Empty.');
                      }else{
                        List response = await postLogin(
                            body: Auth(
                                email: loginForm.emailField.text,
                                password: loginForm.passwordField.text)
                                .toMap());
                        User user = response[0];
                        ResponseStatus aaaa = response[1];
                        if(aaaa.status){
                          _setStatusMessage(aaaa.message);
                        }else{
                          _setStatusMessage(aaaa.message);
                        }

                      }
                    }else{

                    }
                    _changeActivityIndicator();
//                    print(user.toMap());
                  },
                  textColor: Colors.white,
                  color: Theme.of(context).accentColor,
                  child: Text(button1value)),
              RaisedButton(
                onPressed: () {
                  _toggleLoginRegister();
                },
                padding: const EdgeInsets.all(0.0),
                  child: Text(button2value)
              ),
              Visibility(
                  visible: activityIndicator,
                  child: CircularProgressIndicator()),
            ],
          ),
        ));
  }
}
