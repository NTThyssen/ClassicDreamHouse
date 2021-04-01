import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/Model/customer.dart';
import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:classic_dream_house_web/Services/database.dart';
import 'package:classic_dream_house_web/Widgets/menuTopBar.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:classic_cream_couse/theme.dart';

class CreateProjectPage extends StatefulWidget {
  static const String route = '/createProject';

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> with BasicMixin{
 TextEditingController textEditingController1 = TextEditingController();
 TextEditingController textEditingController2 = TextEditingController();
 TextEditingController textEditingController3 = TextEditingController();
 TextEditingController textEditingController4 = TextEditingController();
 TextEditingController textEditingController5 = TextEditingController();
 TextEditingController textEditingController6 = TextEditingController();
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
            children: [
              SizedBox(height: 50,),
              MenuTopBar(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          InputField(textEditingController1),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InputField(textEditingController2),
                          InputField(textEditingController3),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                            child: Text("Opret Bygge Projekt", style: headerTextStyle,),
                            onPressed: () {
                             DatabaseService().createProject(
                                 BuildingProject(customer:Customer(textEditingController1.text, textEditingController2.text, textEditingController3.text), )
                             );
                            },
                          ),
                        ],),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          InputField(textEditingController4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
