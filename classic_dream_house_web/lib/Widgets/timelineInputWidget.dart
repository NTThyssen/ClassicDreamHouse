import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:classic_dream_house_web/Widgets/timelineTitleCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:classic_cream_couse/Model/status.dart';
import 'package:classic_cream_couse/Model/timelineData.dart';

class TimelineInputWidget extends StatefulWidget {
  TimelineData timelineData;
  final bool isLast;
  TimelineInputWidget({this.timelineData, this.isLast});
  @override
  _TimelineInputWidgetState createState() => _TimelineInputWidgetState();
}

class _TimelineInputWidgetState extends State<TimelineInputWidget> {
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(
      children: [
        TimelineTile(
          startChild: OverlayContainer(
            show: _dropdownShown,
            // Let's position this overlay to the right of the button.
            position: OverlayContainerPosition(
              // Left position.
              MediaQuery.of(context).size.width*0.08,
              // Bottom position.
              MediaQuery.of(context).size.height*0.16,
            ),
            // The content inside the overlay.

            child: Container(
              height: 70,
              width: 150,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 3,
                    spreadRadius: 6,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: RawMaterialButton(
                      onPressed:() {
                        widget.timelineData.status = Status.notStarted;
                        _toggleDropdown();
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child:  Icon(Icons.pause_circle_outline, color: appTheme.primaryColor, size: 28,),
                      shape: CircleBorder(),


                  ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                            widget.timelineData.status = Status.complete;
                            _toggleDropdown();
                        },
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(Icons.check_circle, color: appTheme.primaryColor, size: 28,),
                        shape: CircleBorder(),

                      ),
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          widget.timelineData.status = Status.started;
                          _toggleDropdown();
                        },
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child:   SizedBox(height:40, width: 40, child: Icon(Icons.play_circle_outline, color: appTheme.primaryColor, size: 28,)),
                        shape: CircleBorder(),

                      ),
                    ),





                  ]
              ),
            ),
          ),
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
            indicator: widget.timelineData.status == Status.complete ? RawMaterialButton(
              onPressed: _toggleDropdown,
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.check_circle_outline,
                size: 28.0,
                color: appTheme.primaryColor,
              ),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0), side: BorderSide(color: appTheme.primaryColor)),

            ) : widget.timelineData.status == Status.started ? GestureDetector(
              onTap: _toggleDropdown,
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    color: appTheme.backgroundColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RawMaterialButton(
                    onPressed: _toggleDropdown,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(appTheme.primaryColor),
                      backgroundColor: appTheme.backgroundColor,
                    ),
                  ),
                ),
              ),
            ) : widget.timelineData.status == Status.notStarted ? Container(
                decoration: BoxDecoration(
                    color: appTheme.backgroundColor,
                    shape: BoxShape.circle
                ),
                child: RawMaterialButton(
                  onPressed: _toggleDropdown,
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.pause_circle_outline,
                    size: 28.0,
                    color: appTheme.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0), side: BorderSide(color: appTheme.primaryColor)),

                )
            ) : Text("fejl",),
          ),
          alignment: TimelineAlign.manual,
          lineXY: 0.23,
          endChild: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Container(
                child: TimelineTitleCard(widget.timelineData)
            ),
          ),
        ),
      ],
    ),
    );
  }
}
