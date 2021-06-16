import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';

import 'Screens/settings.dart';
mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  Widget appBar() {
    return AppBar(
      backgroundColor: appTheme.primaryColor,
      title: Text("Classic Dream House", style: headerTextStyle.copyWith(fontSize: 26),),
      centerTitle: true,
    );
  }
  @override
  //build
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: fab(),
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            hasTopBar() ? Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color:  appTheme.primaryColor,
                  ),
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 10,
                      children: [
                        TextButton(child:Text("Hjem", style: headerTextStyle),  onPressed: () {
                          Navigator.pushReplacementNamed(context, HomeScreen.route);
                        },),
                        TextButton(child:Text("Indstillinger", style: headerTextStyle),  onPressed: () {
                          Navigator.pushReplacementNamed(context, Settings.route);
                        },),
                      ],
                    ),
                  ),
                ),
              ),
            ) : Container(),
            Expanded(
              flex: 9,
                child: body())
          ],
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool hasTopBar() => true;

  bool extendBehindAppBar() => false;

  Widget fab() => null;

  Widget bottomNavigationBar() => null;

  Widget action() => Container();

  Widget titleWidget() {
    return Container();
  }
}