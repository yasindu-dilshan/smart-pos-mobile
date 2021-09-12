import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/shop.dart';

class ShopService {
  static Future<List<Shop>?> getAllShops() async {
    final response = await http
        .get(Uri.parse('${Config.BACKEND_URL}salesperson/shop?sortBy=+name'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)['items'].map<Shop>((data) {
        return Shop.fromJSON(data);
      }).toList();
    } else {
      throw Exception('Failed to load the leaves');
    }
  }

  static void addShop(String name, String ownerName, String email,
      String telephone, String location, String address) async {
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/shop'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'name': name,
              'email': email,
              'telephone': telephone,
              'location': location,
              'longitude': '7.409',
              'latitude': '80.098',
              'ownerName': ownerName,
              'address': address
            }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to add shop');
    }
  }
}
