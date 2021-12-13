import 'package:flutter/material.dart';

class FizzBuzzProvider with ChangeNotifier {
  String? text;
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  void onTextFieldChanged(String s, {bool isTest = false, String? answer}) {
    if (isTest) {
      text = _fizzBuzzSimple(
        int.parse(s),
      );
      if (isTest) {
        answer = text;
        return;
      }
      notifyListeners();
    } else {
      final isValid = formKeyRegister.currentState!.validate();
      if (isValid) {
        text = _fizzBuzzSimple(
          int.parse(s),
        );
        notifyListeners();
      }
    }
  }

  /// Simple implementation
  String? _fizzBuzzSimple(int n) {
    if (n % 15 == 0) {
      return 'FizzBuzz';
    } else if (n % 5 == 0) {
      return 'Buzz';
    } else if (n % 3 == 0) {
      return 'Fizz';
    }
    return 'None';
  }
}
