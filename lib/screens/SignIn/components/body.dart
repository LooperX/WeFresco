import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wefresco/Screens/SignIn/components/social_login_button.dart';
import 'package:wefresco/Screens/SignUp/signup_screen.dart';
import 'package:wefresco/components/input_field.dart';
import 'package:wefresco/components/rounded_button.dart';
import 'package:wefresco/components/rounded_button_loading.dart';
import 'package:wefresco/components/small_icon_button.dart';
import 'package:wefresco/constants.dart';
import 'package:wefresco/screens/HomePage/homepage_screen_2.dart';
import 'package:wefresco/screens/UserProfile/user_profile.dart';
import 'package:wefresco/services/auth.dart';
import 'package:wefresco/strings.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool keepLoggedIn = true;
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

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

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        // TODO: ADD "LATER" BUTTON FOR REGISTER (signInAnon)
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
                    Hero(
                      tag: 'reg_button',
                      child: RoundedButton(
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
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              pageBuilder: (_, __, ___) => UserProfile(),
                            ),
                          );
                        },
                      ),
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
                    callback: callbackEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                  child: InputField(
                    textPlaceHolder: "Password",
                    isPassword: true,
                    callback: callbackPassword,
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
                  child: RoundedButtonLoading(
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
                              "Login",
                              style: TextStyle(
                                  fontFamily: kPrimaryFontName,
                                  color: Colors.white,
                                  fontSize: 20.0),
                            ),
                    ),
                    text: "Login",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    padding_vertical: 13,
                    padding_horizontal: 0,
                    width: size.width,
                    press: () async {
                      if (email == '' || password == '') {
                        final snackBar = SnackBar(
                            content:
                                Text("Per favore, inserisci tutti i campi"));
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else {
                        setState(() {
                          if (!loading) loading = !loading;
                        });
                        dynamic user = await _auth.signWithEmailAndPassword(
                            email, password);
                        if (user == null) {
                          setState(() {
                            loading = !loading;
                            error = 'An error occurred, try again later';
                            final snackBar = SnackBar(content: Text(error));
                            Scaffold.of(context).showSnackBar(snackBar);
                          });
                        } else {
                          setState(() {
                            loading = !loading;
                          });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        final snackBar =
                            SnackBar(content: Text("ForgotPassword"));
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
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
      ),
    );
  }
}
