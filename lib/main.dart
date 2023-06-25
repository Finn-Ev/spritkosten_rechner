import 'package:spritkosten_rechner/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:spritkosten_rechner/theme/primary_swatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spritkosten',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.white),
        ),
      ),
      color: Colors.white,
      home: const HomeScreen(),
    );
  }
}
