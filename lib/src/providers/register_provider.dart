import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  late String _nameText;
  late String _lastNameText;
  late String _locationText;
  late String _passwordText;

  String get nameText => _nameText;
  set nameText(String name) {
    _nameText = name;
    notifyListeners();
  }

  String get lastNameText => _lastNameText;
  set lastNameText(String lastName) {
    _lastNameText = lastName;
    notifyListeners();
  }

  String get locationText => _locationText;
  set locationText(String lastName) {
    _lastNameText = lastName;
    notifyListeners();
  }

  String get passwordText => _passwordText;
  set passwordText(String password) {
    _passwordText = password;
    notifyListeners();
  }
}
