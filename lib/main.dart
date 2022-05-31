import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Welcome/welcome_screen.dart';
import 'package:jakselin/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jakselin',
      theme: ThemeData(
          primaryColor: kPrimariColor, scaffoldBackgroundColor: Colors.white),
      home: const WelcomeScreen(),
    );
  }
}
