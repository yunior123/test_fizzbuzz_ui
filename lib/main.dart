import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/fizzbuzz_view.dart';

void main() {
  runApp(
    const FizzBuzzApp(),
  );
}

class FizzBuzzApp extends StatelessWidget {
  const FizzBuzzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FizzBuzz Game',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.black,
          size: 24,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const FizzBuzzView(),
    );
  }
}
