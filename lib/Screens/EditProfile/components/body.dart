import "package:flutter/material.dart";
import 'package:jakselin/Screens/EditProfile/components/text_form_input.dart';
import 'package:jakselin/Screens/Profile/components/profile_pic.dart';
import 'package:jakselin/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ProfilePic(),
          const SizedBox(
            height: 16,
          ),
          const TextFormInput(label: "Username", isPassword: false),
          const TextFormInput(label: "Name", isPassword: false),
          const TextFormInput(label: "Email", isPassword: false),
          const TextFormInput(label: "Phone", isPassword: false),
          const TextFormInput(label: "Password", isPassword: true),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              primary: kPrimariColor,
            ),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
