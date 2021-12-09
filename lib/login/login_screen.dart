import 'package:copy_ems/admin/screen/dashboard.dart';
import 'package:copy_ems/component/rounded_button.dart';
import 'package:copy_ems/constrains/constrain.dart';
import 'package:copy_ems/login/registration.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../my_profile.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:9.0),
                child: Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      //height: 200.0,
                      child: Image.asset('images/scom.jpg'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 85.0,
              ),
              Padding(
                  padding:const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RoundedButton(
                        title: 'Log In',
                        colour: Colors.lightBlueAccent,
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, MyProfile.id);
                            }

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      RoundedButton(
                          title: 'Registration',
                          colour: Colors.lightBlueAccent,
                          onPressed: () async {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          }
                      ),
                    ],
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}