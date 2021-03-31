import 'package:classic_cream_couse/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/funkHouse.jpg"),
                    fit: BoxFit.cover,
                    colorFilter:  new ColorFilter.mode(Colors.transparent.withOpacity(0.2), BlendMode.dstATop)
                )
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("CLASSIC DREAM \nHOUSE", style: TextStyle(color: appTheme.primaryColor),textAlign: TextAlign.center,),
              Container(
                width: MediaQuery.of(context).size.width*0.60,
                color: appTheme.backgroundColor,
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(

                    enabled: true,
                    border: OutlineInputBorder(),
                    labelText: "Bruger-ID",
                    labelStyle: TextStyle(

                      fontSize: 22
                    )
                  ),
                ),
              ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child: Text("Login"),
                  onPressed: () {  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
