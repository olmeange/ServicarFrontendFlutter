import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? statusCode;
  User? user;
  String? message;

  LoginModel({
    this.statusCode,
    this.user,
    this.message,
  });

  LoginModel.empty() {
    statusCode = 0;
    user = User.empty();
    message = 'EMPTY';
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        statusCode: json["status_code"],
        user: User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "user": user?.toJson(),
        "message": message,
      };
}

class User {
  String? firstName;
  String? id;
  String? lastName;
  String? location;
  String? password;
  String? userName;

  User({
    this.firstName,
    this.id,
    this.lastName,
    this.location,
    this.password,
    this.userName,
  });

  User.empty() {
    firstName = 'EMPTY';
    id = 'EMPTY';
    lastName = 'EMPTY';
    location = 'EMPTY';
    password = 'EMPTY';
    userName = 'EMPTY';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        id: json["id"],
        lastName: json["last_name"],
        location: json["location"],
        password: json["password"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "id": id,
        "last_name": lastName,
        "location": location,
        "password": password,
        "user_name": userName,
      };
}
