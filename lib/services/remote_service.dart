import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  signIn(String email, String password) async {
    var data = jsonEncode({'email': email, 'password': password});
    var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login/auth'),
        headers: {"Content-Type": "application/json"},
        body: data);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    } else if (response.statusCode == 400) {
      return "Email or Password salah";
    } else {
      return "server sedang bermasalah";
    }
  }
}
