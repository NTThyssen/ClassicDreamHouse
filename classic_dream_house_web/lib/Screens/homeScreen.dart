import 'package:classic_dream_house_web/Widgets/projectWidget.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classic Dream House"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.6
                      ],
                      colors: [
                        Colors.white,
                        Colors.white70
                      ])),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  width: MediaQuery.of(context).size.width*0.80,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index){
                      return StickyHeader(
                        header: Container(
                           color: Colors.blue.withOpacity(0.7),
                          width: MediaQuery.of(context).size.width*0.80,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Wrap(
                              spacing: 50,
                              children: [
                                Text("Hjem", style: TextStyle(color: Colors.white),),
                                Text("Oversigt", style: TextStyle(color: Colors.white),),
                                Text("Indstillinger", style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),

                        content: Container(
                          width: MediaQuery.of(context).size.width*0.80,
                          color: Colors.transparent.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              spacing: 100,
                              runSpacing: 40,
                              children: [
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                                ProjectWidget(),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    ),
                ),
              ),
            );
          }),
    );
  }
}
