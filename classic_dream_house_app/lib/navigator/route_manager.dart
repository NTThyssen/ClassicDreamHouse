import 'package:classic_dream_house_app/screens/PdfViewPage.dart';
import 'package:classic_dream_house_app/screens/mainTabbarPage.dart';
import 'package:flutter/material.dart';


import '../main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RootRoute:
      return MaterialPageRoute(
        builder: (context) {
          return MyApp();
        },
      );
    case MainTabbarPageRoute:
      return MaterialPageRoute(
        builder: (context) {
          return MainTabbarPage();
        },
      );
    case PdfViewRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PdfViewPage();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => MainTabbarPage(),
      );
  }
}

const String MainTabbarPageRoute = "mainPage";
const String PdfViewRoute = "pdfView";
const String RootRoute = "root";
