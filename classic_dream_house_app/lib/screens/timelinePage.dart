import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/widgets/timeline.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService().getProject("lADNY08fzV1PCgTO3x5L"),
      builder: (context, snapshot)
     {
       if(snapshot.hasData){
         print(snapshot.data);
       }
          return   Expanded(
            child: ListView.builder(
                itemCount: snapshot.data.buildProject,
                itemBuilder: (_, index) => Container()
            ),
          );
    }
    );
    return Container(child: Column(
      children: [
        Timeline(title: "Fundament", isComplete: true,),
        Timeline(title: "Tag", isActive: true, isLast: false,),
        Timeline(title: "Vinduer", isActive: false, isLast: true, notStarted: true,),
      ],
    ),);
  }
}
