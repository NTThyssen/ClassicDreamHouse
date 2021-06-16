import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:classic_dream_house_web/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';

import 'Screens/settings.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        Settings.route :(context) => Settings(),
        HomeScreen.route : (context) => HomeScreen(),
        CreateProjectPage.route: (context) => CreateProjectPage(),
      },
      theme: appTheme,
      home: LoginPage(),
    );
  }
}

