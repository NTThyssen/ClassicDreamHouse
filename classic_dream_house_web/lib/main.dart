import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
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
        HomeScreen.route : (context) => HomeScreen(),
        CreateProjectPage.route: (context) => CreateProjectPage(),
      },
      theme: appTheme,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

