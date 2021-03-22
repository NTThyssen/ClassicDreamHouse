import 'package:flutter/material.dart';

class ProjectWidget extends StatefulWidget {
  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.white),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.transparent.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("images/funkHouse.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Text("Kunde: Hans Hansen", style: TextStyle(color: Colors.white),),
        )
      );
  }
}
