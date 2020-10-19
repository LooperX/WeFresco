import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String userName = "Simone";
  String userSurname = "Cuccurullo";

  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Profilo",
                  style: TextStyle(fontSize: 40.0),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/mirko.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Text(
                          "Registrati",
                      ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
