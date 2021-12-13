import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:test_fizzbuzz_ui/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets(
        'FizzBuzz',
        (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          final textField = find.byType(TextField);
          expect(textField, findsOneWidget);

          await tester.enterText(textField, '15');

          await tester.pumpAndSettle();

          expect(find.text('FizzBuzz'), findsOneWidget);
        },
      );
    },
  );
}
