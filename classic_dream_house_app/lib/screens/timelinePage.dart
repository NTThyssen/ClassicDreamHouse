import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
class TimelinePage extends StatefulWidget {
  final String uuid;
  TimelinePage({this.uuid});
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {

  double animCounter = 0.5;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService().projectStream(widget.uuid),
        builder: (context, snapshot)      {
          return snapshot.hasData ? Container(
            child: ListView.builder(
              itemCount: snapshot.data.timeLineData.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () async {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Container(width: 50, height: 50,child: Center(child: Text("Info",))),
                              content: Container(
                                  height: 80,
                                  width: 250,
                                  child: Text("Vi skulle gerne have sendt dig mail med et ID, som du skal indtaste i App'en. Ellers kontakt os om ID",)),
                              actions: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 95, maxHeight: 40),
                                  child: FlatButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  width: 120,
                                  height: 40,
                                )
                              ],
                            );
                          }
                      );
                    },
                    child: FadeIn(animCounter++, Timeline(title: snapshot.data.timeLineData[index].title, timelineData: snapshot.data.timeLineData[index],
                      isLast:  index+1 == snapshot.data.timeLineData.length,)),
                  ),
            ),
          ) : Container();
        }
        );

  }
}

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 130.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (300 * delay).round().milliseconds,
      duration: 500.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
