import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/navigator/route_manager.dart';
import 'package:classic_dream_house_app/screens/mainTabbarPage.dart';
import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/services/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_library/adaptive_library.dart';
import 'dart:io' show Platform;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input;
  final _text = TextEditingController();
  bool _validate = false;
  String errorMsg="Feltet må ikke være tomt";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPref().read("iddd"),
        builder: (context, snapshot) {
          return snapshot.data == null ?
              Container(
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
                                controller: _text,
                                onChanged: (textInput) {
                                  input = textInput;
                                },
                                decoration: InputDecoration(
                                    enabled: true,
                                    border: OutlineInputBorder(),
                                    labelText: "Bruger-ID",
                                    errorText: _validate ? errorMsg : null,
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
                                _text.text.isEmpty ? _validate = true : _validate = false;
                                print(_validate);
                                var res;
                                if(!_validate){
                                  try{
                                    res = await  DatabaseService().getProject(input) ;
                                  }catch(e){
                                    print(e);
                                    res = null;
                                  }

                                  if(res != null){
                                    await SharedPref().save("iddd",
                                        res.projectuuId ?? "saved id");
                                    Navigator.pushReplacement(
                                        context,MaterialPageRoute(
                                      builder: (context) {
                                        return MainTabbarPage(uuid:res.projectuuId);
                                      },
                                    ));
                                  }else{
                                    _text.text.isEmpty  ? errorMsg = "Feltet må ikke være tomt" : errorMsg="Ikke korrekt ID";
                                    _validate = true;
                                    setState(() {

                                    });
                                  }
                                }
                                setState(() {

                                });
                                print(_validate);
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
                              onPressed: () async {
                                  return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Container(width: 50, height: 50,child: Center(child: Text("Info", style: appTheme.textTheme.headline2.copyWith(color: appTheme.primaryColor),))),
                                          content: Container(
                                              child: Text("Vi skulle gerne have sendt dig mail med et ID, som du skal indtaste i App'en. Ellers kontakt os om ID",style: appTheme.textTheme.bodyText1.copyWith(color:appTheme.primaryColor, fontSize: 16),)),
                                          actions: [
                                             FlatButton(
                                                  child: Text("Ok"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),

                                          ],
                                        );
                                      }
                                  );

                          },
                        )),
                      )
                    ],
                  ),

          ) : MainTabbarPage(uuid: snapshot.data ,);
        }
    );
  }

}
