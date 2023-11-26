// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String? address;
  int? clientCode;
  String? documentId;
  String? email;
  String? firstName;
  String? id;
  String? lastName;
  String? phone;

  Client({
    this.address,
    this.clientCode,
    this.documentId,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.phone,
  });

  Client.empty() {
    address = 'EMPTY';
    clientCode = 0;
    documentId = 'EMPTY';
    email = 'EMPTY';
    firstName = 'EMPTY';
    id = 'EMPTY';
    lastName = 'EMPTY';
    phone = 'EMPTY';
  }

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        address: json["address"],
        clientCode: json["client_code"],
        documentId: json["document_id"],
        email: json["email"],
        firstName: json["first_name"],
        id: json["id"],
        lastName: json["last_name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "client_code": clientCode,
        "document_id": documentId,
        "email": email,
        "first_name": firstName,
        "id": id,
        "last_name": lastName,
        "phone": phone,
      };
}
