import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/clavier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/clavier': (context) => ClavierApp(),
        // Add routes for other pages here
      },
    );
  }
}
