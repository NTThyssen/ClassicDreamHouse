import 'package:classic_cream_couse/theme.dart';
import 'package:flutter/material.dart';

class ProjectWidget extends StatefulWidget {
  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  double progress = 0.10;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.black),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.transparent.withOpacity(1), BlendMode.dstATop),
            image: AssetImage("images/funkHouse.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            SizedBox(
              height: 80,
              width: 80,
              child: Stack(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      backgroundColor: appTheme.accentColor,
                      valueColor: new AlwaysStoppedAnimation<Color>(appTheme.primaryColor),
                      value: progress,
                    ),
                  ),
                  Center(
                      child: Text(progress.toString() + "%")
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                  borderRadius: BorderRadius.only(
                      topLeft:  const  Radius.circular(10.0),
                      topRight: const  Radius.circular(10.0))
              ),
              width: 400,
              height: 100,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Navn: Hans Hansen", style: TextStyle(color: appTheme.primaryColor),),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Budget : 4 Mil", style: TextStyle(color: appTheme.primaryColor),),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Addresse: Kollegiebakken 9 ", style: TextStyle(color: appTheme.primaryColor),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Igang med: Fundament", style: TextStyle(color: appTheme.primaryColor),),
                      ),
                  ],
                  ),

                ],
              ),
            ),
          ],
        )
      );
  }
}
