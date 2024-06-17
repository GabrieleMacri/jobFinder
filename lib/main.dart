import 'package:flutter/material.dart';
import 'package:job_finder/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18.0, lineHeight: 1.4),
          bodyText2: TextStyle(fontSize: 18.0, lineHeight: 1.4),
        ),
      ),
    );
  }
}
