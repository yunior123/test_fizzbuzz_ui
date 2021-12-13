import 'package:flutter_test/flutter_test.dart';
import 'package:test_fizzbuzz_ui/providers/fizzbuzz_provider.dart';

void main() {
  group(
    'Fizz Buzz',
    () {
      final provider = FizzBuzzProvider();
      final fn = provider.onTextFieldChanged;
      String? answer = 'FizzBuzz';
      fn(
        '15',
        isTest: true,
        answer: answer,
      );
      test(
        'calculate simple fizzbuzz',
        () {
          expect(
            answer,
            'FizzBuzz',
          );
        },
      );
    },
  );
}
