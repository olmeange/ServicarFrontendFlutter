import 'dart:convert';
import 'package:http/http.dart' as http;

class ScheduleService {
  late int statusCode;
  late String message;

  Future<List<dynamic>> getSchedulesPerPage(int page, String userId) async {
    const String url = 'http://192.168.100.14:5000/api';
    final String endpoint = '$url/get_schedules_by_user/$page';
    List posts = [];
    final response = await http.get(Uri.parse(endpoint),
        headers: {"Content-Type": "application/json", "userId": userId});

    statusCode = jsonDecode(response.body)['status_code'];
    message = jsonDecode(response.body)['message'];

    if (response.statusCode != 200) {
      posts.add('EMPTY');
      return posts;
    }

    posts.addAll(jsonDecode(response.body)['schedules']);
    return posts;
  }
}
