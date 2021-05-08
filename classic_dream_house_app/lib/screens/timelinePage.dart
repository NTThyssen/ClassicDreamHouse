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
        builder: (context, snapshot)      {
          if(snapshot.hasData){
            print(snapshot.data.projectuuId);
            print(snapshot.data.timeLineData[0].status);
          }
          return snapshot.hasData ? Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.timeLineData.length,
                    itemBuilder: (_, index) =>  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Timeline(title: snapshot.data.timeLineData[index].title, timelineData: snapshot.data.timeLineData[index],),
                    ),
                  ),
                ),
              ],
            ),
          ) : Container();
        }
        );

  }
}
