// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homebrew/models/coffee_Info.dart';
import 'package:homebrew/main.dart';
import 'package:homebrew/screens/enter_amount_screen.dart';

void main() {

   testWidgets('Test The backbutton in enter_amount_screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final backbutton = find.byKey(Key('back-btn'));
    
    Selection information = Selection(0,'');
    await tester.pumpWidget(MaterialApp(home: WaterAmount(information)));
    await tester.tap(backbutton);

    expect(find.text('What coffee maker are you using?'), findsNothing);
 });
  
}
