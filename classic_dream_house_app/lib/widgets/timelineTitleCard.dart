import 'package:classic_cream_couse/theme.dart';
import 'package:flutter/material.dart';

class TimelineTitleCard extends StatefulWidget {
  final String title;
  TimelineTitleCard(this.title);
  @override
  _TimelineTitleCardState createState() => _TimelineTitleCardState();
}

class _TimelineTitleCardState extends State<TimelineTitleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        child: Center(
            child: Text(widget.title, style: TextStyle(color: appTheme.primaryColor, fontSize: 18),
            )
        ),
      ),
    );
  }
}
