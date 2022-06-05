import 'package:flutter/material.dart';
import 'package:jakselin/Screens/EditProfile/edit_profile.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Profile/components/profile_menu.dart';
import 'package:jakselin/Screens/Profile/components/profile_pic.dart';
import 'package:jakselin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'button.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.profile}) : super(key: key);

  final User profile;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var profile = widget.profile;
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const ProfilePic(),
              const SizedBox(
                height: 20,
              ),
              Text(
                profile.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileMenu(
                menu: 'Username',
                value: profile.username,
                icon: Icons.person_outline,
              ),
              ProfileMenu(
                menu: 'Email',
                value: profile.email,
                icon: Icons.mail_outline,
              ),
              ProfileMenu(
                menu: 'Telepon',
                value: profile.nohp,
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
                  text: "Edit Profile"),
              const SizedBox(
                height: 20,
              ),
              Button(
                  press: () {
                    setState(() {
                      _isLoading = true;
                    });
                    logout();
                  },
                  text: "Logout"),
            ],
          );
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get('token');
    var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/logout'),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      setState(() {
        sharedPreferences.setString('token', '');
        _isLoading = false;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      });
    } else {
      throw Exception("Tidak Berhasil Logout");
    }
  }
}
