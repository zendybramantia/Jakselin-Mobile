import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Profile/profile.dart';
import 'package:jakselin/Screens/Welcome/components/background.dart';
import 'package:jakselin/models/shared_pref.dart';
import 'package:jakselin/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<User> user;
  @override
  void initState() {
    super.initState();
    checkLogin(context, '/MainScreen');
  }

  // checkLoginStatus() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString('token') != '') {
  //     user = fetchData();
  //     User userr = await user;
  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => ProfileScreen(profile: userr)),
  //       (Route<dynamic> route) => false,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                primary: const Color(0xffF39A97)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('Lanjut',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
