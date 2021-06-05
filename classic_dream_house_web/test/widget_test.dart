// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
import 'package:classic_dream_house_web/Screens/createProjectPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:classic_dream_house_web/main.dart';

void main() {
  testWidgets('Timeline Timeline Element', (WidgetTester tester) async {
    final timelineBtn = find.byKey(ValueKey("timelineBtn"));
    final addTimelineBtn = find.byKey(ValueKey("addTimelineKey"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: CreateProjectPage()));
    await tester.tap(timelineBtn);
    // Verify that our counter starts at 0.
    await tester.pump();
    expect(find.text("Tilføj til tidslinje"), findsOneWidget);

    await tester.enterText(find.byKey(ValueKey("inputTimeline")), "Fundament");
    await tester.tap(addTimelineBtn);

    expect(find.text("Fundament"), findsOneWidget);
  });
}
