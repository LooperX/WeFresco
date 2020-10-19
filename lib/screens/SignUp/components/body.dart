import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wefresco/components/back_button.dart';
import 'package:wefresco/components/fade_in.dart';
import 'package:wefresco/components/input_field.dart';
import 'package:wefresco/components/rounded_button_loading.dart';
import 'package:wefresco/constants.dart';
import 'package:wefresco/screens/HomePage/homepage_screen_2.dart';
import 'package:wefresco/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = false;
  String name = '';
  String surname = '';
  String email = '';
  String password = '';
  String error = '';

  callbackName(childName) {
    setState(() {
      name = childName;
    });
  }

  callbackSurname(childSurname) {
    setState(() {
      surname = childSurname;
    });
  }

  callbackEmail(childEmail) {
    setState(() {
      email = childEmail;
    });
  }

  callbackPassword(childPassword) {
    setState(() {
      password = childPassword;
    });
  }

  void _wait() async {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePageScreen2();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  BackButtonCustom(),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Iscriviti",
                style: TextStyle(fontSize: 40.0),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: kPrimaryFontName,
                      color: kBlackLight),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Crea subito un nuovo account su ",
                    ),
                    TextSpan(
                      text: "WeFresco ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              FadeIn(
                0.2,
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 5.0),
                  child: InputField(
                    textPlaceHolder: "Nome",
                    callback: callbackName,
                  ),
                ),
              ),
              FadeIn(
                0.5,
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: InputField(
                    textPlaceHolder: "Cognome",
                    callback: callbackSurname,
                  ),
                ),
              ),
              FadeIn(
                0.8,
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: InputField(
                    textPlaceHolder: "Email",
                    callback: callbackEmail,
                  ),
                ),
              ),
              FadeIn(
                1.1,
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                  child: InputField(
                    textPlaceHolder: "Password",
                    isPassword: true,
                    callback: callbackPassword,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Hero(
                tag: 'reg_button',
                child: RoundedButtonLoading(
                  // https://flutterawesome.com/a-collection-of-loading-indicators-animated-with-flutter/
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) =>
                            ScaleTransition(
                      child: child,
                      scale: animation,
                    ),
                    child: loading
                        ? SpinKitThreeBounce(
                            color: Colors.white,
                            size: 26.0,
                          )
                        : Text(
                            "Registrati",
                            style: TextStyle(
                                fontFamily: kPrimaryFontName,
                                color: Colors.white,
                                fontSize: 20.0),
                          ),
                  ),
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  padding_vertical: 13,
                  padding_horizontal: 0,
                  width: size.width,
                  press: () async {
                    //TODO: DELETE
                    /*
                    dynamic user = await _auth.signInAnon();
                    if (user == null) {
                      print("Sign-in error");
                    } else {
                      print("Sign-in success:");
                      print(user.uid);
                    }*/
                    // https://www.youtube.com/watch?v=jl5E0UfAGVs&t=140s
                    if (name == '' ||
                        surname == '' ||
                        email == '' ||
                        password == '') {
                      final snackBar = SnackBar(
                          content: Text("Per favore, inserisci tutti i campi"));
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() {
                        if (!loading) loading = !loading;
                      });
                      dynamic user = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (user == null) {
                        setState(() {
                          error = 'An error occurred, try again later';
                          final snackBar = SnackBar(content: Text(error));
                          Scaffold.of(context).showSnackBar(snackBar);
                          loading = !loading;
                        });
                      } else {
                        print("Sign-in success:");
                        print(user.uid);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePageScreen2();
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
