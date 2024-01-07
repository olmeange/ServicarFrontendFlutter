import 'package:flutter/material.dart';
import 'package:servicarmt/src/client.dart';
import 'package:servicarmt/src/vehicle.dart';

class AppointmentProvider with ChangeNotifier {
  late Client client;
  late Vehicle vehicle;

  Client get clientText => client;
  set clientText(Client client) {
    client = client;
    notifyListeners();
  }

  Vehicle get vehicleText => vehicle;
  set vehicleText(Vehicle vehicle) {
    vehicle = vehicle;
    notifyListeners();
  }
}
