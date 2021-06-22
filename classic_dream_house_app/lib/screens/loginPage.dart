import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/navigator/route_manager.dart';
import 'package:classic_dream_house_app/screens/mainTabbarPage.dart';
import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/services/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_library/adaptive_library.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/scheduler.dart';
import 'dart:io' show Platform;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPref().read("idddd"),
        builder: (context, snapshot) {
          return snapshot.data == null ? FutureBuilder<
              BuildingProject>(
              future: DatabaseService().getProject("lADNY08fzV1PCgTO3x5L"),
              builder: (context, snapshot) {
                return Container(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/funkHouse.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.transparent.withOpacity(0.2),
                                    BlendMode.dstATop)
                            )
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("CLASSIC DREAM \nHOUSE", style: TextStyle(
                                color: appTheme.primaryColor),
                              textAlign: TextAlign.center,),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.60,
                              color: appTheme.backgroundColor,
                              child: TextField(
                                onChanged: (textInput) {
                                  input = textInput;
                                },
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
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(appTheme.primaryColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            18.0),
                                      )
                                  )
                              ),
                              child: Text("Login"),
                              onPressed: () async {
                                print(snapshot.data.customer.name);
                                await SharedPref().save("iddd",
                                    snapshot.data.projectuuId ?? "saved id");
                                print(await SharedPref().read("iddd"));
                                Navigator.pushReplacementNamed(
                                    context, MainTabbarPageRoute);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Align(
                          alignment: Alignment.topRight,
                            child: AdaptiveIconButton(
                              icon: Icon(Icons.help, color: appTheme.primaryColor, size:  30,),
                              iconCupertino: Icon(Icons.help, color: appTheme.primaryColor, size: 30,),
                              onPressed: () {
                                if (Platform.isAndroid) {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          child: AlertDialog(
                                            title: Center(child: Text("Info", style: appTheme.textTheme.headline2.copyWith(color: appTheme.primaryColor),)),
                                            content: Text("Vi skulle gerne have sendt dig mail med et ID, som du skal indtaste i App'en. Ellers kontakt os om ID",style: appTheme.textTheme.bodyText1.copyWith(color:appTheme.primaryColor, fontSize: 16),),
                                            actions: [
                                              AdaptiveAlertDialogButton(
                                                  closeOnPress: true,
                                                  child: Text("Ok"),
                                                  onPressed: null)
                                            ],
                                          ),
                                        );
                                      }
                                  );
                                } else if (Platform.isIOS) {
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          child: CupertinoAlertDialog(
                                            title: Center(child: Text("Info", style: appTheme.textTheme.headline2.copyWith(color: appTheme.primaryColor),)),
                                            content: Text("Vi skulle gerne have sendt dig mail med et ID, som du skal indtaste i App'en. Ellers kontakt os om ID",style: appTheme.textTheme.bodyText1.copyWith(color:appTheme.primaryColor, fontSize: 16),),
                                            actions: [
                                              AdaptiveAlertDialogButton(
                                                  closeOnPress: true,
                                                  child: Text("Ok"),
                                                  onPressed: null)
                                            ],
                                          ),
                                        );
                                      }
                                  );
                                }



                          },
                        )),
                      )
                    ],
                  ),
                );
              }
          ) : MainTabbarPage();
        }
    );
  }

}
