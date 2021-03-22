import 'package:classic_dream_house_web/Widgets/projectWidget.dart';
import 'package:classic_dream_house_web/theme.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  PageController pageController = PageController(initialPage:0);





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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        title: Text("Classic Dream House"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Spacer(flex: 1,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color:  appTheme.primaryColor,
              ),
              width: MediaQuery.of(context).size.width*0.85,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  spacing: 50,
                  children: [
                    TextButton(child:Text("Hjem"),  onPressed: () {  },),
                    TextButton(child:Text("Oversigt"),  onPressed: () {  },),
                    TextButton(child:Text("Indstillinger"),
                        onPressed: () {  },)
                  ],
                ),
              ),
            ),
          ),
              Expanded(
                flex: 20,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 120,
                      left: MediaQuery.of(context).size.width*0.12,
                      right: MediaQuery.of(context).size.width*0.12,
                      child: Container(
                      width: MediaQuery.of(context).size.width*0.60,
                      height: MediaQuery.of(context).size.height*0.70,
                      color: appTheme.dividerColor,
                      ),
                    ),
                    PageView(
                      physics: AlwaysScrollableScrollPhysics() ,
                      controller: pageController,
                    children: [
                      Scrollbar(
                        controller: ScrollController(),
                        child: SingleChildScrollView(
                          child: Padding(
                           padding: EdgeInsets.all(16),
                           child: Container(
                             width: MediaQuery.of(context).size.width*0.95,
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
                                 ],
                               ),
                             ),
                           ),
                          ),
                        ),
                      ),
                      Scrollbar(
                        controller: ScrollController(),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.95,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                   ] ),
                    Positioned(
                      right: 40,
                      top: MediaQuery.of(context).size.height*0.32 ,
                      child: MaterialButton(
                      height: 50,
                        minWidth: 10,
                        color: appTheme.primaryColor,
                        shape: CircleBorder(),
                        child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white), onPressed: (){
                        pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                        pageIndex++;
                        if(pageIndex > 0){
                          setState(() {

                          });
                        }
                      }
                        )
                    ),
                    Positioned(
                        left: 40,
                        top: MediaQuery.of(context).size.height*0.32 ,
                        child: MaterialButton(
                            height: 50,
                            minWidth: 10,
                            color: pageIndex == 0  ? appTheme.disabledColor : appTheme.primaryColor,
                            shape: CircleBorder(),
                            child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white), onPressed: (){
                              pageController.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                              pageIndex--;
                              if(pageIndex == 0){
                                setState(() {

                                });
                              }
                        }
                        )
                    )
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
                      child: Text("Opret Nyt Bygge Projekt"),
                      onPressed: () {  },

          ),
                  ),
                ),
              ),
      )
      ]),
      );
    }


}

