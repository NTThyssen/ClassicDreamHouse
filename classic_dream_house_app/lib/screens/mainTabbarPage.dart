import 'package:classic_cream_couse/theme.dart';
import 'package:classic_dream_house_app/screens/documentsPage.dart';
import 'package:classic_dream_house_app/screens/timelinePage.dart';
import 'package:classic_dream_house_app/widgets/timeline.dart';
import 'package:flutter/material.dart';

class MainTabbarPage extends StatefulWidget {
  @override
  _MainTabbarPageState createState() => _MainTabbarPageState();
}

class _MainTabbarPageState extends State<MainTabbarPage> with TickerProviderStateMixin {
  TabController tabController;
  bool isFirstTab = true;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(

          backgroundColor: appTheme.primaryColor.withOpacity(0.60),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: appTheme.primaryColor),
            physics: AlwaysScrollableScrollPhysics(),
            controller: tabController,
            tabs: [
              Tab(child: Text("Timeline"),),
              Tab(child: Text("Dokumenter"),)
            ],
          ),
        ),
      ),
      body: Container(
          child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/funkHouse.jpg"),
                      fit: BoxFit.cover,
                      colorFilter:  new ColorFilter.mode(Colors.transparent.withOpacity(0.6), BlendMode.dstATop)
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70  , 0, 0),
                  child: TabBarView(
                    controller: tabController,
                    children: [TimelinePage(), DocumentsPage()],
                  ),
                )
              ]
          )
      ),
    );
  }
}
