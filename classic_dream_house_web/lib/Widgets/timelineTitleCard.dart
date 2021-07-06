import 'dart:typed_data';

import 'package:circular_menu/circular_menu.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_web/Widgets/timelineInputWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:classic_cream_couse/Model/timelineData.dart';
class TimelineTitleCard extends StatefulWidget {
  final TimelineData title;
  TimelineTitleCard(this.title);
  @override
  _TimelineTitleCardState createState() => _TimelineTitleCardState();
}

class _TimelineTitleCardState extends State<TimelineTitleCard> {
  TextEditingController textEditingController = TextEditingController(text:"");
  bool isEnable = false;
  GlobalKey _formKey = GlobalKey();

  void _toggleEdit() {
    setState(() {
      isEnable = !isEnable;
    });
  }

  pickFile() async{
    String fileName;
    var picked = await FilePicker.platform.pickFiles(allowMultiple: true, );
    if (picked != null) {
      Uint8List fileBytes = picked.files.first.bytes;
      fileName = picked.files.first.name;
      //await uploadToFirebase(fileBytes, fileName);
    }
    return fileName;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(icon: Icon(Icons.edit, color: appTheme.primaryColor,), onPressed: (){
                setState(() {
                  isEnable = true;
                });

              }),
            ),
            Expanded(
              flex: 1,
              child: IconButton(icon: Icon(Icons.image_rounded, color: appTheme.primaryColor,), onPressed: (){
                setState(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            width: MediaQuery.of(context).size.width*0.60,
                            height:  MediaQuery.of(context).size.height*0.60,
                            child: Scrollbar(
                              isAlwaysShown: true,
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FractionallySizedBox(
                                            child: InputField(labelText: "Billed Titel",controller: textEditingController,)),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.image, size: 200, color: appTheme.primaryColor,),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MainButtonType(
                                            buttonText:"Tilføj billede til "+widget.title.title,
                                            onClick: () {
                                              setState(() async {
                                                    await pickFile();
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                });
              }),
            ),
            Expanded(
              flex: 10,
              child: Center(
                  child: TextFormField(
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: appTheme.primaryColor,
                              width: 2.0),
                        )
                    ),
                    onEditingComplete: _toggleEdit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appTheme.primaryColor,
                      fontSize: 18
                    ),
                    onChanged: (input){
                      widget.title.title = input;
                    },
                    initialValue: widget.title.title,
                    enabled: isEnable,
                  ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
