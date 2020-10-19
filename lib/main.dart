import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wefresco/models/user.dart';
import 'package:wefresco/screens/Wrapper/wrapper.dart';
import 'package:wefresco/services/auth.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'We Fresco',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Nunito')),
        home: Wrapper(),
      ),
    );
  }
}
