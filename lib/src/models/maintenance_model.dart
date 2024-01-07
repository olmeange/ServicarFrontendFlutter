import 'dart:convert';

List<MaintenanceModel> maintenanceModelFromJson(String str) =>
    List<MaintenanceModel>.from(
        json.decode(str).map((x) => MaintenanceModel.fromJson(x)));

String maintenanceModelToJson(List<MaintenanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaintenanceModel {
  String description;
  String id;

  MaintenanceModel({
    required this.description,
    required this.id,
  });

  factory MaintenanceModel.fromJson(Map<String, dynamic> json) =>
      MaintenanceModel(
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
      };
}
