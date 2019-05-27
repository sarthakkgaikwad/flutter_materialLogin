import 'package:flutter/material.dart';
import './src/validate_mixin.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(LoginMaterial());

class LoginMaterial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginMaterialState();
  }
}

class LoginMaterialState extends State<LoginMaterial> with ValidateMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 150.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    emailField(),
                    passwordField(),
                    buttonField(),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, bottom: 30.0, left: 40.0),
                      child: Text('Forgot Password',
                          style: TextStyle(
                              color: Color(0xFF3059E1),
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      color: Color(0xFFA3A4A9),
                      margin: EdgeInsets.only(left: 40.0, right: 40.0),
                      height: 2.0,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                      height: 50.0,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF3059E1)),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.face,
                              size: 30.0,
                              color: Color(0xFF3059E1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: 35.0),
                            child: Text(
                              'Login with face ID',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF3059E1),
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Email', style: TextStyle(color: Color(0xFF164551))),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'xyz@gmail.com',
            ),
            validator: emailMixin,
            onSaved: (String value) {
              email = value;
            },
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Password', style: TextStyle(color: Color(0xFF164551))),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '********',
            ),
            validator: passwordMixin,
            onSaved: (String value) {
              password = value;
            },
          )
        ],
      ),
    );
  }

  Widget buttonField() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: RaisedButton(
        color: Color(0xFF3CA2B3),
        child: Container(
          width: double.infinity,
          height: 50.0,
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print('Username: $email & Password: $password');
          }
        },
      ),
    );
  }
}
