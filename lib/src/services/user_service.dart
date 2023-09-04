import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servicarmt/src/models/user_model.dart';

class UserService {
  final _url = 'http://192.168.100.14:5000/api';

  Future<UserModel> login(String userName, String password) async {
    final String url = '$_url/login';
    Map body = {'user_name': userName, 'password': password};

    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    print(response.body);
    return userModelFromJson(response.body);
  }
}
