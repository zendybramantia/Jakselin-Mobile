import 'package:flutter/material.dart';
import 'package:jakselin/models/colors.dart';

class profiletest extends StatelessWidget {
  const profiletest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
          child: Center(
        child: Text("Profile Screen"),
      )),
    );
  }
}
