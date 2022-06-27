import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/constants.dart';
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
// checkLogin(BuildContext context) async {
//   if (await islogin(context)) {
//     User user = await fetchUserData();
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (BuildContext context) => const MainScreen()),
//       (Route<dynamic> route) => false,
//     );
//   } else {
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
//       (Route<dynamic> route) => false,
//     );
//   }
// }

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
  var response = await http.get(Uri.parse('$apiUrl/api/user/token'),
      headers: {"Authorization": "Bearer $token"});
  if (response.statusCode == 200) {
    print(response.body);
    var jsonData = jsonDecode(response.body);
    return User.fromJson(jsonData);
  } else {
    throw Exception(response.body);
  }
}

Future<User> getUserbyID(String id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.get('token');
  var response = await http.get(Uri.parse('$apiUrl/api/user/$id'),
      headers: {"Authorization": "Bearer $token"});
  if (response.statusCode != 200) {
    throw "Gagal Fetching data user by id";
  }
  var data = jsonDecode(response.body);
  User user = User.fromJson(data["user"][0]);
  return user;
}

// Future<String> getUserString() async {
//   SharedPref pref = SharedPref();
//   String userStr = pref.read('user');
//   return userStr;
// }

// User fetchUserData() {
//   String userString = getUserString() as String;
//   return UserFromJson(userString);
// }
