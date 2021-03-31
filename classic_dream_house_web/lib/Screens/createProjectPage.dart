import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:classic_dream_house_web/Widgets/menuTopBar.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';

class CreateProjectPage extends StatefulWidget {
  static const String route = '/createProject';
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> with BasicMixin{

  @override
  Widget body() {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              MenuTopBar(),
              Row(
                children: [
                  Column(
                    children: [
                      InputField(),
                    ],
                  ),
                  Column(
                    children: [
                      InputField(),
                    ],)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


}
