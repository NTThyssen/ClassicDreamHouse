import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/navigator/route_manager.dart';
import 'package:classic_dream_house_app/screens/mainTabbarPage.dart';
import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/services/sharedPreferences.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input;
  @override
  Widget build(BuildContext context) {
    return SharedPref().read("id") == null ? FutureBuilder<BuildingProject>(
      future: DatabaseService().getProject("SAXq4F5Hwh6XOIchSct6"),
      builder: (context, snapshot) {
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
                      onChanged: (textInput){
                        input = textInput;
                      },
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
                      onPressed: () async {
                          print(snapshot.data.customer.name);
                          await SharedPref().save("idd", snapshot.data.projectuuId ?? "saved id");
                          print(await SharedPref().read("idd"));
                          Navigator.pushReplacementNamed(context, MainTabbarPageRoute);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    ) :  MainTabbarPage();
  }
}
