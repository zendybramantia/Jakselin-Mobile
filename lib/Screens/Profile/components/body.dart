import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jakselin/Screens/EditProfile/edit_profile.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Profile/components/profile_menu.dart';
import 'package:jakselin/Screens/Profile/components/profile_pic.dart';
import 'package:jakselin/Screens/Profile/profile.dart';
import 'package:jakselin/models/shared_pref.dart';
import 'package:jakselin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'button.dart';

class Body extends StatefulWidget {
  const Body({Key? key, this.profile}) : super(key: key);

  final User? profile;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // User user = User();

  @override
  void initState() {
    super.initState();
    checkLogin(context, null);
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return FutureBuilder(
        future: fetchUserData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            var user = snapshot.data as User;
            return Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const ProfilePic(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  user.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileMenu(
                  menu: 'Username',
                  value: user.username!,
                  icon: Icons.person_outline,
                ),
                ProfileMenu(
                  menu: 'Email',
                  value: user.email!,
                  icon: Icons.mail_outline,
                ),
                ProfileMenu(
                  menu: 'Telepon',
                  value: user.nohp!,
                  icon: Icons.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()),
                    );
                  },
                  text: "Edit Profile",
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  press: () {
                    logout();
                  },
                  text: "Logout",
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get('token');
    var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/logout'),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      setState(() {
        sharedPreferences.remove('token');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      });
    } else {
      throw Exception("Tidak Berhasil Logout");
    }
>>>>>>> 738dc5c2cb0e665e2a7ec5fc6abb52fe5b0d127c
  }
}
