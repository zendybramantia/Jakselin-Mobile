import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Profile/components/body.dart';
import 'package:jakselin/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.profile}) : super(key: key);

  final User profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Body(profile: profile));
  }
}
