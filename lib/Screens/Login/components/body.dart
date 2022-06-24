import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jakselin/Screens/EditProfile/components/text_form_input.dart';
import 'package:jakselin/Screens/Main/main_screen.dart';
import 'package:jakselin/Screens/Profile/profile.dart';
import 'package:jakselin/Widget/textfield_component.dart';
import 'package:jakselin/Screens/Login/components/background.dart';
import 'package:jakselin/Screens/Register/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:jakselin/constants.dart';
import 'package:jakselin/models/shared_pref.dart';
import 'package:jakselin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool submit = true;
  late Future<User> user;
  @override
  void initState() {
    super.initState();
    setState(() {
      submit = true;
    });
    // checkLogin(context);
    // checkLoginStatus();
  }

  // checkLoginStatus() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString('token') != '') {
  //     print(sharedPreferences.get('token'));
  //     user = fetchData();
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             builder: (BuildContext context) =>
  //                 ProfileScreen(profile: user as User)),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MASUK',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFieldComponent(
              size: size,
              title: 'Email',
              controller: emailController,
              isPassword: false),
          const SizedBox(
            height: 10,
          ),
          TextFieldComponent(
              size: size,
              title: 'Password',
              controller: passwordController,
              isPassword: true),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              primary: kPrimariColor,
            ),
            onPressed: submit
                ? () {
                    signIn(
                        emailController.text, passwordController.text, context);
                    setState(() {
                      submit = false;
                    });
                  }
                : null,
            child: const Text('Masuk',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Belum punya akun?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(20, 20),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: const Text(
                  'daftar disini',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Lupa password? ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegisterScreen();
                      },
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(20, 20),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: const Text(
                  'klik disini',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  signIn(String email, String password, BuildContext context) async {
    var data = jsonEncode({'email': email, 'password': password});
    var response = await http.post(Uri.parse('$apiUrl/api/login/auth'),
        headers: {"Content-Type": "application/json"}, body: data);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      var jsonDataBody = jsonDecode(response.body);
      var token = jsonDataBody['token'];
      var jsonData = jsonDataBody['user'];
      print(jsonData);
      setState(() {
        sharedPreferences.setString('token', token);
        sharedPreferences.setString('user', jsonEncode(jsonData));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const MainScreen()),
            (Route<dynamic> route) => false);
      });
      // return User.fromJson(jsonData);
    } else if (response.statusCode == 400) {
      throw "Email or Password salah";
    } else {
      throw "server sedang bermasalah";
    }
  }

  // Future<User> fetchData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var token = sharedPreferences.get('token');
  //   var response = await http.get(
  //       Uri.parse('http://127.0.0.1:8000/api/user/token'),
  //       headers: {"Authorization": "Bearer $token"});
  //   if (response.statusCode == 200) {
  //     var jsonData = jsonDecode(response.body);
  //     return User.fromJson(jsonData);
  //   } else {
  //     throw Exception("Failed to load User");
  //   }
  // }
}
