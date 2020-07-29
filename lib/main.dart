import 'package:flutter/material.dart';

import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Fresco',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Nunito'
          )
      ),
      home: WelcomeScreen(),
    );
  }
}
