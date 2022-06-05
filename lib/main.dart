import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';

import 'package:jakselin/Screens/Register/register_screen.dart';
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
      debugShowCheckedModeBanner: true,
      title: 'Jakselin',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPrimariColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/WelcomeScreen': (context) => const WelcomeScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
        '/RegisterScreen': (context) => const RegisterScreen(),
        // '/ProfileScreen': (context) => const ProfileScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
