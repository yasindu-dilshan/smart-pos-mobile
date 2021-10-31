import 'dart:convert';

import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/salesperson.dart';
import 'package:http/http.dart' as http;

class SalespersonService {
  static Future<Salesperson> getSalesperson(String? uid) async {
    final response =
        await http.get(Uri.parse('${Config.BACKEND_URL}users/me?uid=$uid'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Salesperson.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load the leaves');
    }
  }
}
