import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  Widget appBar() {
    appBar:return AppBar(
      backgroundColor: appTheme.primaryColor,
      title: Text("Classic Dream House", style: headerTextStyle.copyWith(fontSize: 26),),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: body(),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;

  Widget bottomNavigationBar() => null;

  Widget action() => Container();

  Widget titleWidget() {
    return Container();
  }
}