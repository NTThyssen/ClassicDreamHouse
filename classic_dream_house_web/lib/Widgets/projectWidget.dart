import 'package:classic_cream_couse/theme.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/Model/status.dart';

class ProjectWidget extends StatefulWidget {
  final BuildingProject buildingProject;
  ProjectWidget({this.buildingProject});
  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  double progress = 0.10;
  double getCompletedTasks(BuildingProject buildingProject){
    double completed =0;
    for(var i in buildingProject.timeLineData){
        if(i.status == Status.complete){
            completed++;
        }
    }
    //print(buildingProject.timeLineData.length/completed);
    return completed/buildingProject.timeLineData.length;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(color: appTheme.primaryColor, width: 0.5),
      shadowColor: Colors.grey,
      borderOnForeground: true,
      color: Colors.white,
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
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
                          value: getCompletedTasks(widget.buildingProject),
                        ),
                      ),
                      Center(
                          child: Text("${getCompletedTasks(widget.buildingProject).toStringAsFixed(2) }  %")
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
                          child: Text("Navn: " + widget.buildingProject.customer.name, style: bodyTextStyle,),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Email : " +  widget.buildingProject.customer.email, style: bodyTextStyle,),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Mobil: " + widget.buildingProject.customer.mobile,style:bodyTextStyle,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Bygge adresse: " +widget.buildingProject.customer.buildingAddress , style:bodyTextStyle,),
                          ),
                      ],
                      ),

                    ],
                  ),
                ),
              ],
            )
          ),
      ),
    );
  }
}
