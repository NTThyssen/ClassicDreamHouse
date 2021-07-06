import 'package:classic_dream_house_web/mixin.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
class Settings extends StatefulWidget {
  static const String route = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with BasicMixin {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget body() {
    return Container(
      width: MediaQuery.of(context).size.width*0.60,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) {
            return  Container(
              width: 800,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputField(labelText: "email",controller: username, inputKey: Key('1'), ),
                      InputField(labelText: "Password",controller: password, isPassword: true,),
                      MainButtonType(
                        buttonText:"Opret Bruger",
                        onClick: () async {
                          try {
                            var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: username.text,
                                password: password.text
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }



}
