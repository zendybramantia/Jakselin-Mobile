import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key).toString());
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

checkLogin(BuildContext context, String? ifLogged) async {
  if (!await islogin(context)) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  } else if (ifLogged != null) {
    Navigator.pushNamed(context, ifLogged);
  }
}

Future<bool> islogin(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getString('token') == null) {
    return false;
  } else if (sharedPreferences.getString('token') != null) {
    return true;
  }
  return false;
}

Future<User> fetchUserData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.get('token');
  var response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/user/token'),
      headers: {"Authorization": "Bearer $token"});
  if (response.statusCode == 200) {
    print(response.body);
    var jsonData = jsonDecode(response.body);
    return User.fromJson(jsonData);
  } else {
    throw Exception(response.body);
  }
}
