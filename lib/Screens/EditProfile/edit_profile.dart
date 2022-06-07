import 'package:flutter/material.dart';
import 'package:jakselin/Screens/EditProfile/components/body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key, required this.id}) : super(key: key);
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Body(
          id: id!,
        ));
  }
}
