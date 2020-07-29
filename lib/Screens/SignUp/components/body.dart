import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wefresco/components/back_button.dart';
import 'package:wefresco/components/input_field.dart';
import 'package:wefresco/components/rounded_button_loading.dart';
import 'package:wefresco/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool loading = false;

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 5.0),
                child: InputField(
                  textPlaceHolder: "Nome",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: InputField(
                  textPlaceHolder: "Cognome",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: InputField(
                  textPlaceHolder: "Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: InputField(
                  textPlaceHolder: "Password",
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              RoundedButtonLoading(
                // https://flutterawesome.com/a-collection-of-loading-indicators-animated-with-flutter/
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
                color: kPrimaryColor,
                textColor: Colors.white,
                padding_vertical: 13,
                padding_horizontal: 0,
                width: size.width,
                press: () {
                  setState(() {
                    if(!loading)
                      loading = !loading;
                    //TODO: send data to server
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
