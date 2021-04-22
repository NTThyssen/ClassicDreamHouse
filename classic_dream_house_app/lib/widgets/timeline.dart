import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/widgets/timelineTitleCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
class Timeline extends StatefulWidget {
  final bool isComplete;
  final bool isActive;
  final String title;
  final bool isLast;
  final bool notStarted;

  Timeline({this.isActive, this.title, this.isLast, this.notStarted, this.isComplete});
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(
      children: [
        TimelineTile(
          beforeLineStyle: LineStyle(
            color: appTheme.primaryColor
          ),
          afterLineStyle: widget.isLast ?? false ?  LineStyle(color: Colors.transparent)  :LineStyle(
              color: appTheme.primaryColor
          ),
          indicatorStyle: IndicatorStyle(
            height: 36,
            width: 36,
            drawGap: true,
            indicator: widget.isComplete ?? false ? Container(
              decoration: BoxDecoration(
                  color: appTheme.backgroundColor,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.check_circle_outline, color: appTheme.primaryColor, size: 28,),
            ) : widget.isActive ?? false ? Container(
                decoration: BoxDecoration(
                    color: appTheme.backgroundColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(appTheme.primaryColor),
                    backgroundColor: appTheme.backgroundColor,
                  ),
                ),
          ) : widget.notStarted ?? false ? Container(
              decoration: BoxDecoration(
                  color: appTheme.backgroundColor,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.pause_circle_outline, color: appTheme.primaryColor, size: 28,)
            ) : Text("fejl",),
          ),
          alignment: TimelineAlign.manual,
          lineXY: 0.15,
          endChild: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: TimelineTitleCard(widget.title?? "test")
            ),
          ),
        ),
      ],
    ),
    );
  }
}
