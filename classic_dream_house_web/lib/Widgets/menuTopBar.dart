import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
class MenuTopBar extends StatefulWidget {
  @override
  _MenuTopBarState createState() => _MenuTopBarState();
}

class _MenuTopBarState extends State<MenuTopBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color:  appTheme.primaryColor,
        ),
        width: MediaQuery.of(context).size.width*0.85,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            spacing: 50,
            children: [
              TextButton(child:Text("Hjem", style: headerTextStyle),  onPressed: () {  },),
              TextButton(child:Text("Oversigt", style: headerTextStyle),  onPressed: () {  },),
              TextButton(child:Text("Indstillinger", style: headerTextStyle),
                onPressed: () {  },)
            ],
          ),
        ),
      ),
    );
  }
}
