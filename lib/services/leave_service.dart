import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/leave.dart';

class LeaveService {
  static Future<List<Leave>?> getAllLeaves() async {
    final response = await http
        .get(Uri.parse('${Config.BACKEND_URL}salesperson/leave?sortBy=+from'));
    // print(jsonDecode(response.body)['items']);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)['items'].map<Leave>((data) {
        return Leave.fromJSON(data);
      }).toList();
    } else {
      throw Exception('Failed to load the leaves');
    }
  }

  static void addLeave(String description, String from, String to) async {
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/leave'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'userId': '613496813d385f4154c38d48',
              'description': description,
              'approved': 'False',
              'from': from,
              'to': to
            }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to add leave');
    }
  }
}
