import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/widgets/timelineTitleCard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
class Timeline extends StatefulWidget {
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
          afterLineStyle: LineStyle(
              color: appTheme.primaryColor
          ),
          indicatorStyle: IndicatorStyle(
            height: 30,
            width: 30,
            drawGap: true,
            indicator: Container(
              decoration: BoxDecoration(
                  color: appTheme.backgroundColor,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.check_circle_outline, color: appTheme.primaryColor, size: 24,),
            ),
            color: appTheme.dividerColor
          ),
          alignment: TimelineAlign.manual,
          lineXY: 0.15,
          endChild: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: TimelineTitleCard("Fundament")
            ),
          ),
        ),
        TimelineTile(
            beforeLineStyle: LineStyle(
                color: appTheme.primaryColor
            ),
            afterLineStyle: LineStyle(
                color: appTheme.disabledColor
            ),
            indicatorStyle: IndicatorStyle(
                height: 30,
                width: 30,
                drawGap: true,
                indicator: Container(
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
                ),
                color: appTheme.primaryColor
            ),
            alignment: TimelineAlign.manual,
            lineXY: 0.15,
          endChild: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: TimelineTitleCard("Tag"),
            ),
          ),

        ),
      ],
    ),
    );
  }
}
