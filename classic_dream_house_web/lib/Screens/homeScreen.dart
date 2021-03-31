import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:classic_dream_house_web/Widgets/menuTopBar.dart';
import 'package:classic_dream_house_web/Widgets/projectWidget.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BasicMixin {
  int pageIndex = 0;
  PageController pageController = PageController(initialPage:0, viewportFraction: 0.99);

  _onPageViewChange(int page) {
    int previousPage = page;
    if(page == 0) pageIndex=0;
    else pageIndex = page;
    setState(() {

    });
  }



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
    // TODO: implement body
    return Scaffold(
      body: Column(
          children: [
            Spacer(flex: 1,),
            MenuTopBar(),
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
                        onPageChanged: _onPageViewChange,
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
                            color: appTheme.primaryColor ,
                            shape: CircleBorder(),
                            child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white), onPressed: (){
                          pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
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
    );
  }


}

