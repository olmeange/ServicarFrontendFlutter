import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:servicarmt/src/models/user_model.dart';

class UserService {
  final _url = 'http://192.168.100.14:5000/api';

  Future<UserModel> getUser(String id) async {
    final String url = '$_url/get_user/$id';
    final UserModel userModel = UserModel.empty();

    final response = await http
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      userModel.statusCode = jsonDecode(response.body)['status_code'];
      userModel.message = jsonDecode(response.body)['message'];
      //print(userModel.toJson());
      return userModel;
    }

    //print(userModel.toJson());
    return userModelFromJson(response.body);
  }
}
