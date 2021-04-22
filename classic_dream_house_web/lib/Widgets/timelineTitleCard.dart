import 'package:circular_menu/circular_menu.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_web/Widgets/timelineInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
class TimelineTitleCard extends StatefulWidget {
  final String title;
  TimelineTitleCard(this.title);
  @override
  _TimelineTitleCardState createState() => _TimelineTitleCardState();
}

class _TimelineTitleCardState extends State<TimelineTitleCard> {
  TextEditingController textEditingController = TextEditingController(text: "");
  bool isEnable = false;

  void _toggleEdit() {
    setState(() {
      isEnable = !isEnable;
    });
  }
  @override
  Widget build(BuildContext context) {
    print(widget.title);
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
                    initialValue: widget.title,
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
