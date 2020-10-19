import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wefresco/models/user.dart';
import 'package:wefresco/screens/HomePage/homepage_screen_2.dart';
import 'package:wefresco/screens/SignIn/signin_screen.dart';
import 'package:wefresco/screens/Welcome/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return Homepage or Welcome

    // il problema è che quando cambi screen (ne pushi una sopra a quella attuale),
    // il wrapper perde la capacità di cambiare pagina. Magari vedere se inbeve di
    // navigator mettere return funziona
    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomePageScreen2();
    }
  }
}
