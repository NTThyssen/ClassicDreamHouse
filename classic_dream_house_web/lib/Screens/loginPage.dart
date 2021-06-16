import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:classic_dream_house_web/Screens/test.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BasicMixin {
  TextEditingController username =  TextEditingController();
  TextEditingController password =  TextEditingController();
  @override
  bool hasTopBar() {
    // TODO: implement hasTopBar
    return false;
  }

  @override
  Widget body() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/funkHouse.jpg"),
                fit: BoxFit.cover,
                colorFilter:  new ColorFilter.mode(Colors.transparent.withOpacity(0.3), BlendMode.dstATop)
            )
          ),
        ),
        Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: appTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40 ,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputField(labelText: "Username", controller: username,),
                  InputField(labelText: "Password", controller: password,),

                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 150, height: 40),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )
                          )
                      ),
                      child: Text("Login"),
                      onPressed: () async {
                        Navigator.pushReplacementNamed(context, HomeScreen.route);
                      },
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),

      ],
    );
  }


}
