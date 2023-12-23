// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navigator_app/main.dart';

void main() {
  testWidgets('FirstRoute appears first', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FirstRoute());

    // Test to make sure the FirstRoute is displayed
    expect(find.text("route"), findsOneWidget);
  });

  testWidgets("Routing to SecondRoute works", (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(FirstRoute());

    // Verify FirstRoute is displayed
    expect(find.text("Open route"), findsOneWidget);

    // Tap the button to trigger SecondRoute
    await tester.tap(find.text("Open route"));
    await tester.pump();

    // Verify SecondRoute is displayed
    expect(find.text("Go back!"), findsOneWidget);
  });
}
