import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:classic_dream_house_web/Services/database.dart';
import 'package:classic_dream_house_web/Widgets/menuTopBar.dart';
import 'package:classic_dream_house_web/Widgets/projectWidget.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:quiver/iterables.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BasicMixin {
  Widget  _loadingWidget = SpinKitFadingCircle(
    size: 150,
    color: appTheme.backgroundColor,
  );
  int pageIndex = 0;
  PageController pageController = PageController(initialPage:0, viewportFraction: 0.99);
  var buildingList = [];

  _onPageViewChange(int page) {
    int previousPage = page;
    if(page == 0) pageIndex=0;
    else pageIndex = page;
    setState(() {

    });
  }

  bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    pageController = new PageController();
    super.initState();
  }


  @override
  Widget body() {
    int segmentCount=1;
    // TODO: implement body
    return StreamBuilder<List<BuildingProject>>(
        stream: DatabaseService().getProjects,
        builder: (context, snapshot) {
          if(snapshot.hasData){
           for(int i = 0; i < snapshot.data.length; i++){
             if((i % 6) == 0 && i != 0){
               segmentCount++;
             }
           }
          }

      return AnimatedSwitcher(
        child: snapshot.hasData ? Scaffold(
          body: Container(
            color: Colors.grey[250],
            child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                                height: 50,
                                minWidth: 10,
                                color: pageIndex == 0  ? appTheme.disabledColor : appTheme.primaryColor,
                                shape: CircleBorder(),
                                child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white), onPressed: (){
                              pageController.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                            }
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: PageView.builder(
                              physics: AlwaysScrollableScrollPhysics() ,
                              controller: pageController,
                              onPageChanged: _onPageViewChange,
                              itemCount: segmentCount,
                              itemBuilder: (context, index){
                                var segments = partition(snapshot.data, 6);
                                return ProjectWidgetContainer(buildingProject: segments.elementAt(index),);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                                height: 50,
                                minWidth: 10,
                                color: segmentCount == 1  ? appTheme.disabledColor : appTheme.primaryColor ,
                                shape: CircleBorder(),
                                child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white), onPressed: (){
                              pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                            }
                            ),
                          ),

                        ]),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 500,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                            child: Text("Opret Nyt Bygge Projekt", style: headerTextStyle,),
                            onPressed: () {
                              Navigator.pushNamed(context, CreateProjectPage.route);
                            },

                          ),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ) :  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SpinKitCubeGrid(
              size: 80,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? appTheme.primaryColor :appTheme.backgroundColor,
                  ),
                );
              },
            ),
          ),
        ),
          duration: const Duration(seconds: 4),
      );
      }
    );

  }


}
class ProjectWidgetContainer extends StatelessWidget {
  List<BuildingProject> buildingProject;
  ProjectWidgetContainer({this.buildingProject});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 600,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: buildingProject.length,
        itemBuilder: (BuildContext ctx, index) {
         return Padding(
           padding: EdgeInsets.all(16),
           child: Container(

             width: MediaQuery.of(context).size.width*0.95,
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: GestureDetector(
                 onTap: () {
                   Navigator.push(
                       context,
                       PageRouteBuilder(
                           transitionDuration: Duration(seconds: 1),
                           pageBuilder: (_, __, ___) => CreateProjectPage(buildingProject: buildingProject[index],)));
                 },
                   child: ProjectWidget(buildingProject: buildingProject[index],)
               ),
             ),
           ),
         );
        });


  }
}

