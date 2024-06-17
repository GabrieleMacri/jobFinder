import 'package:flutter/material.dart';
import 'package:job_finder/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Semantics(
        label: 'Home Screen',
        child: HomeScreen(),
      ),
    );
  }
}
