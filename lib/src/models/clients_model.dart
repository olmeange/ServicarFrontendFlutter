import 'dart:convert';

ClientsModel clientsModelFromJson(String str) =>
    ClientsModel.fromJson(json.decode(str));

String clientsModelToJson(ClientsModel data) => json.encode(data.toJson());

class ClientsModel {
  List<Client>? clients;
  int? statusCode;
  String? message;

  ClientsModel({
    this.clients,
    this.statusCode,
    this.message,
  });

  ClientsModel.empty() {
    clients = [];
    statusCode = 0;
    message = 'EMPTY';
  }

  factory ClientsModel.fromJson(Map<String, dynamic> json) => ClientsModel(
        clients:
            List<Client>.from(json["clients"].map((x) => Client.fromJson(x))),
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "clients": List<dynamic>.from(clients!.map((x) => x.toJson())),
        "status_code": statusCode,
        "message": message,
      };
}

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
