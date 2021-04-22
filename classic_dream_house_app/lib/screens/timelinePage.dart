import 'package:classic_dream_house_app/widgets/timeline.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [
        Timeline(title: "Fundament", isComplete: true,),
        Timeline(title: "Tag", isActive: true, isLast: false,),
        Timeline(title: "Vinduer", isActive: false, isLast: true, notStarted: true,),
      ],
    ),);
  }
}
