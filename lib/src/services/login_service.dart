import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servicarmt/src/models/login_model.dart';

class LoginService {
  final _url = 'http://192.168.100.14:5000/api';

  Future<LoginModel> login(String userName, String password) async {
    final String url = '$_url/login';
    final LoginModel loginModel = LoginModel.empty();
    Map body = {'user_name': userName, 'password': password};

    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode != 200) {
      loginModel.statusCode = jsonDecode(response.body)['status_code'];
      loginModel.message = jsonDecode(response.body)['message'];
      return loginModel;
    }

    return loginModelFromJson(response.body);
  }
}
