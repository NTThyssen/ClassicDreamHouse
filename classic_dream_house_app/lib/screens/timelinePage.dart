import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  double animCounter = 0.5;
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
            child: ListView.builder(
              itemCount: snapshot.data.timeLineData.length,
              itemBuilder: (context, index) =>
                  FadeIn(animCounter++, Timeline(title: snapshot.data.timeLineData[index].title, timelineData: snapshot.data.timeLineData[index],
                    isLast:  index+1 == snapshot.data.timeLineData.length,)),
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
