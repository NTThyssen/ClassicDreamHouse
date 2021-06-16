
import 'package:adaptive_library/adaptive_library.dart';
import 'package:classic_dream_house_app/screens/loginPage.dart';
import 'package:classic_dream_house_app/screens/mainTabbarPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/navigator/route_manager.dart' as router;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      AdaptiveInheritance(
        adaptiveState: AdaptiveInheritance.getStateByPlatform(),
        child: AdaptiveApp(
          debugShowCheckedModeBanner: false,
          home: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: router.RootRoute,
              onGenerateRoute: router.generateRoute,
              theme: appTheme,
              home:MyApp()
          ),
        ),
      ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: LoginPage(),
    );
  }
}
