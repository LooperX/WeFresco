import 'package:flutter/material.dart';
import 'package:wefresco/Screens/SignIn/signin_screen.dart';
import 'package:wefresco/components/rounded_button.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: kPrimaryFontName,
                    color: Colors.black87),
                children: <TextSpan>[
                  TextSpan(
                    text: "Benvenuto su\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  TextSpan(
                    text: "WeFresco ",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 15.0),
                children: <TextSpan>[
                  TextSpan(
                    text: welcome_text_1,
                    style: TextStyle(color: kBlackLight),
                  ),
                  TextSpan(
                    text: "naturalità ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  TextSpan(
                    text: welcome_text_2,
                    style: TextStyle(color: kBlackLight),
                  ),
                  TextSpan(
                    text: "prodotti migliori ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  TextSpan(
                    text: "da portare a tavola.",
                    style: TextStyle(color: kBlackLight),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RoundedButton(
                    text: "Inizia subito!",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    padding_vertical: 13,
                    padding_horizontal: 20,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
