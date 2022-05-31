import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Register/components/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(bottom: false, child: Body()));
  }
}
