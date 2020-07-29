import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wefresco/components/input_field.dart';
import 'package:wefresco/components/rounded_button.dart';
import 'package:wefresco/components/small_icon_button.dart';
import 'package:wefresco/constants.dart';
import 'package:wefresco/strings.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage("assets/images/welcome_image.jpg"),
//          fit: BoxFit.cover,
//          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.90), BlendMode.dstATop)
//        ),
//      ),
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
                  padding_vertical: 13,
                  padding_horizontal: 0,
                  width: 0.3,
                  press: () {},
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
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    press: (){},
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
                press: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  forgot_password,
                  style: TextStyle(
                    color: kBlackLight,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
              child: const Divider(
                color: kGreyLight200,
                height: 5,
                thickness: 2,
                indent: 15,
                endIndent: 15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/google_login.svg",
                  height: size.height * 0.05,
                ),
                SvgPicture.asset(
                  "assets/icons/facebook_login.svg",
                  height: size.height * 0.05,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
