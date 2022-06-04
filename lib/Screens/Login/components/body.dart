import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Welcome/welcome_screen.dart';
import 'package:jakselin/Widget/textfield_component.dart';
import 'package:jakselin/Screens/Login/components/background.dart';
import 'package:jakselin/Screens/Register/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:jakselin/constants.dart';
import 'package:jakselin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != '') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const RegisterScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    late Future<User> user;
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
              size: size, title: 'Username', controller: emailController),
          const SizedBox(
            height: 10,
          ),
          TextFieldComponent(
              size: size, title: 'Password', controller: passwordController),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              primary: kPrimariColor,
            ),
            onPressed: () {
              user = signIn(
                  emailController.text, passwordController.text, context);
            },
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

  Future<User> signIn(
      String email, String password, BuildContext context) async {
    var data = jsonEncode({'email': email, 'password': password});
    var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login/auth'),
        headers: {"Content-Type": "application/json"},
        body: data);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      var jsonDataBody = jsonDecode(response.body);
      var token = jsonDataBody['token'];
      var jsonData = jsonDataBody['user'];
      var id = jsonData['id'];
      var email = jsonData['email'];
      var name = jsonData['name'];
      var nohp = jsonData['nohp'];
      var username = jsonData['username'];
      var avatar = jsonData['avatar'];
      setState(() {
        sharedPreferences.setString('token', token);
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => const WelcomeScreen())),
        );
      });
      return User(
          id: id,
          email: email,
          name: name,
          nohp: nohp,
          username: username,
          password: password,
          avatar: avatar);
    } else if (response.statusCode == 400) {
      throw "Email or Password salah";
    } else {
      throw "server sedang bermasalah";
    }
  }
}
