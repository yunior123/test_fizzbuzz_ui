// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_fizzbuzz_ui/main.dart';

void main() {
  testWidgets(
    'FizzBuzz',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        const FizzBuzzApp(),
      );
      final textField = find.byType(TextField);

      expect(textField, findsOneWidget);
      expect(find.text('FizzBuzz'), findsNothing);

      await tester.enterText(textField, '15');
      await tester.pump();

      expect(find.text('FizzBuzz'), findsOneWidget);
    },
  );
}
