import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wefresco/Screens/HomePage/homepage_screen.dart';
import 'package:wefresco/Screens/SignIn/components/social_login_button.dart';
import 'package:wefresco/Screens/SignUp/signup_screen.dart';
import 'package:wefresco/components/input_field.dart';
import 'package:wefresco/components/rounded_button.dart';
import 'package:wefresco/components/small_icon_button.dart';
import 'package:wefresco/constants.dart';
import 'package:wefresco/strings.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool keepLoggedIn = true;
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RoundedButton(
                    text: "Registrati",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    padding_vertical: 12,
                    fontSize: 18.0,
                    padding_horizontal: 0,
                    width: 0.25,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                "Accedi",
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                "Bentornato!",
                style: TextStyle(color: kBlackLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SmallIconButton(
                      icon: Icons.check,
                      backgroundColor:
                          keepLoggedIn ? kPrimaryColor : kGreyLight200,
                      iconColor: keepLoggedIn ? Colors.white : Colors.black54,
                      press: () {
                        setState(() {
                          keepLoggedIn = !keepLoggedIn;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        keep_logged_in,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: RoundedButton(
                  text: "Login",
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  padding_vertical: 13,
                  padding_horizontal: 0,
                  width: size.width,
                  press: () {
                    //TODO: Check login information from server
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePageScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(content: Text("ForgotPassword"));
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      forgot_password,
                      style: TextStyle(
                        color: kBlackLight,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: const Divider(
                  color: kGreyLight200,
                  height: 5,
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SocialLoginButton(
                    socialMethod: "google",
                  ),
                  SocialLoginButton(
                    socialMethod: "facebook",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
