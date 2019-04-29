import 'package:flutter/material.dart';
import '../../models/User.dart';
import '../../models/Auth.dart';
import '../../models/Register.dart';
import '../../models/ResponseStatus.dart';
import '../../services/services.dart';
import '../../widgets/forms/register.dart';
import '../../widgets/forms/login.dart';
import '../../util/user.dart';
import '../../data/globals.dart' as globals;

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
  Color statusMessageColor = Colors.black;
  LoginForm loginForm = new LoginForm();
  RegisterForm registerForm = new RegisterForm();

  void _changeActivityIndicator(bool status) {
    setState(() {
      activityIndicator = status;
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
        logoSize = 80;
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

  void _setStatusMessage(String status, Color color){
    setState(() {
      statusMessage = status;
      statusMessageColor = color;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new
    WillPopScope(child:
    Scaffold(
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
              Text(statusMessage,
                  style: TextStyle(color: statusMessageColor)),
              RaisedButton(
                  onPressed: () async {
                    _setStatusMessage('', Colors.black);
                    _changeActivityIndicator(true);
                    if(showLoginForm) {
                      if(loginForm.passwordField.text == '' || loginForm.emailField.text == ''){
                        _setStatusMessage('Email or Password Field is Empty.', Colors.red);
                      }else{
                        List response = await postLogin(
                            body: Auth(
                                email: loginForm.emailField.text,
                                password: loginForm.passwordField.text)
                                .toMap());
                        User user = response[0];
                        ResponseStatus response_data = response[1];
                        if(response_data.status){
                          _setStatusMessage(response_data.message, Colors.green);
                          storeUser(user);
                          globals.user = user;
                          Navigator.pop(context);
                        }else{
                          _setStatusMessage(response_data.message, Colors.red);
                        }
                      }
                    }else{
                      bool formstatus = true;
                      if(registerForm.passwordField.text != registerForm.passwordConfirmationField.text){
                        _setStatusMessage('Passwords do not match.', Colors.red);
                        formstatus = false;
                      }
                      if(registerForm.passwordField.text == ''){
                        _setStatusMessage('Password field is empty.', Colors.red);
                        formstatus = false;
                      }
                      if(registerForm.usernameField.text == ''){
                        _setStatusMessage('Username field is empty.', Colors.red);
                        formstatus = false;
                      }
                      if(registerForm.emailField.text == ''){
                        _setStatusMessage('Email field is empty.', Colors.red);
                        formstatus = false;
                      }
                      if(formstatus){
                        ResponseStatus response = await postRegister(
                            body: Register(
                                email: registerForm.emailField.text,
                                username: registerForm.usernameField.text,
                                password: registerForm.passwordField.text)
                                .toMap());
                        if(response.status){
                          _setStatusMessage(response.message, Colors.green);
                          registerForm.usernameField.clear();
                          registerForm.emailField.clear();
                          registerForm.passwordField.clear();
                          registerForm.passwordConfirmationField.clear();
                        }else{
                          _setStatusMessage(response.message, Colors.red);
                        }
                      }

                    }
                    _changeActivityIndicator(false);
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
        ))
        , onWillPop: () async => false);
  }
}
