import 'package:flutter/material.dart';
import 'package:servicarmt/src/models/user_model.dart';

class LoginProvider with ChangeNotifier {
  //late String _userText;
  //late String _passwordText;

  late UserModel _userModel;

  UserModel get userModel => _userModel;
  set userModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  /*String get passwordText => _passwordText;
  set passwordText(String password) {
    _passwordText = password;
    notifyListeners();
  }*/
}
