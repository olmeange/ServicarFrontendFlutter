import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  late String _userText;
  late String _passwordText;

  String get userText => _userText;
  set userText(String user) {
    _userText = user;
    notifyListeners();
  }

  String get passwordText => _passwordText;
  set passwordText(String password) {
    _passwordText = password;
    notifyListeners();
  }
}
