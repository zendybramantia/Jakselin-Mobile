import 'package:flutter/material.dart';
import 'package:jakselin/Screens/EditProfile/edit_profile.dart';
import 'package:jakselin/Screens/Profile/components/profile_menu.dart';
import 'package:jakselin/Screens/Profile/components/profile_pic.dart';

import 'button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        const ProfilePic(),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Zendy Bramantia",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const ProfileMenu(
          menu: 'Username',
          value: 'zendykecil',
          icon: Icons.person_outline,
        ),
        const ProfileMenu(
          menu: 'Email',
          value: 'zendyoke@gmail.com',
          icon: Icons.mail_outline,
        ),
        const ProfileMenu(
          menu: 'Telepon',
          value: '0813131123',
          icon: Icons.phone,
        ),
        const SizedBox(
          height: 20,
        ),
        Button(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
            text: "Edit Profile"),
        const SizedBox(
          height: 20,
        ),
        Button(press: () {}, text: "Log Out"),
      ],
    );
  }
}
