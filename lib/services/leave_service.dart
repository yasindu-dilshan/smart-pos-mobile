import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/leave.dart';

class LeaveService {
  static Future<List<Leave>?> getAllLeaves(String? id, String token) async {
    final response = await http.get(
      Uri.parse('${Config.BACKEND_URL}salesperson/leave/$id?sortBy=+from'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)['items'].map<Leave>((data) {
        return Leave.fromJSON(data);
      }).toList();
    } else {
      throw Exception('Failed to load the leaves');
    }
  }

  static void deleteLeave(String? id, String token) async {
    await http.delete(
      Uri.parse('${Config.BACKEND_URL}salesperson/leave/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static void addLeave(
      String description, String from, String to, String id, String token) async {
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/leave'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, String>{
              'userId': id,
              'description': description,
              'approved': 'pending',
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
