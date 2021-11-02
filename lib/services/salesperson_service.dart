import 'dart:convert';
import 'dart:io';

import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/salesperson.dart';
import 'package:http/http.dart' as http;

class SalespersonService {
  static Future<Salesperson> getSalesperson(String? uid, String token) async {
    final response =
        await http.get(Uri.parse('${Config.BACKEND_URL}users/me/$uid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
        );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Salesperson.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load the user');
    }
  }
}
