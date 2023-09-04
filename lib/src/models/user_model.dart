import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String firstName;
  String id;
  String lastName;
  String location;
  String password;
  String userName;

  UserModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.location,
    required this.password,
    required this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
