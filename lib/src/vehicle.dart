// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  String? mark;
  String? model;
  String? year;
  String? plate;

  Vehicle({
    this.mark,
    this.model,
    this.year,
    this.plate,
  });

  Vehicle.empty() {
    mark = 'EMPTY';
    model = 'EMPTY';
    year = 'EMPTY';
    plate = 'EMPTY';
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        mark: json["mark"],
        model: json["model"],
        year: json["year"],
        plate: json["plate"],
      );

  Map<String, dynamic> toJson() => {
        "mark": mark,
        "model": model,
        "year": year,
        "plate": plate,
      };
}
