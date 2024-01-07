import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:servicarmt/src/models/vehcicles_model.dart';

class VehicleService {
  late int statusCode;
  late String message;

  Future<List<dynamic>> getVehiclesPerPage(int page) async {
    const String url = 'http://192.168.100.14:5000/api';
    final String endpoint = '$url/vehicles/$page';
    List posts = [];
    final response = await http.get(Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"});

    statusCode = jsonDecode(response.body)['status_code'];
    message = jsonDecode(response.body)['message'];

    if (response.statusCode != 200) {
      posts.add('EMPTY');
      return posts;
    }

    posts.addAll(jsonDecode(response.body)['vehicles']);
    return posts;
  }
}
