import 'package:jakselin/models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<int> getPost() async {
    var client = http.Client();
    var url = Uri.parse('http://127.0.0.1:8000/api/login/auth');
    var response = await client.get(url);
    return response.statusCode;
  }
}
