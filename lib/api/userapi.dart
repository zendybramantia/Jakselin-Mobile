import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Profile/profile.dart';

registerUser(String nama, String email, String username, String password,
    String nohp, BuildContext context) async {
  var data = jsonEncode({
    'name': nama,
    'email': email,
    'username': username,
    'password': password,
    'nohp': nohp,
  });
  var response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/user/'),
    headers: {"Content-Type": "application/json"},
    body: data,
  );
  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  } else {
    throw "Gagal Registrasi Akun";
  }
}

updateUser(String id, String nama, String email, String username,
    String password, String nohp, BuildContext context) async {
  var data = jsonEncode({
    'name': nama,
    'email': email,
    'username': username,
    'password': password,
    'nohp': nohp,
  });
  var response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/user/update/$id'),
    headers: {"Content-Type": "application/json"},
    body: data,
  );
  if (jsonDecode(response.body)['message'] == "Success") {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen()),
      (Route<dynamic> route) => false,
    );
  } else {
    throw "Gagal Edit Profile";
  }
}
