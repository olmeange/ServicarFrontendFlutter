import 'package:http/http.dart' as http;
import 'package:servicarmt/src/models/maintenance_model.dart';

class MaintenanceService {
  final _url = 'http://192.168.100.14:5000/api';

  Future<List<MaintenanceModel>> getMaintenance() async {
    final String url = '$_url/maintenances';
    //Map body = {'user_name': userName, 'password': password};

    final response = await http
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print(response.body);
    return maintenanceModelFromJson(response.body);
  }
}
