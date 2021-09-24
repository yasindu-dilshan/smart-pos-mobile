import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:location/location.dart';

class ShopService {
  static Future<List<Shop>?> getAllShops() async {
    final response = await http
        .get(Uri.parse('${Config.BACKEND_URL}salesperson/shop?sortBy=+name'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)['items'].map<Shop>((data) {
        return Shop.fromJSON(data);
      }).toList();
    } else {
      throw Exception('Failed to load the shops');
    }
  }

  static Future<List<Shop>?> getAssignedShops(String? id) async {
    final response = await http
        .get(Uri.parse('${Config.BACKEND_URL}salesperson/assignedShops/$id'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)['shops'].map<Shop>((data) {
        return Shop.fromJSON(data);
      }).toList();
    } else {
      throw Exception('Failed to load the assigned shops');
    }
  }

  static Future<Shop?> getOneShop() async {
    final response = await http.get(Uri.parse(
        '${Config.BACKEND_URL}/salesperson/shop/61366f2747ecc3419cad28fc'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Shop.fromJSON(jsonDecode(response.body)['result']);
    }
  }

  static void addShop(String name, String ownerName, String email,
      String telephone, String loc, String address) async {
    // Location
    var location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.longitude);
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/shop'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'name': name,
              'email': email,
              'telephone': telephone,
              'location': loc,
              'longitude': _locationData.longitude.toString(),
              'latitude': _locationData.latitude.toString(),
              'ownerName': ownerName,
              'address': address,
              'warehouse': Config.WAREHOUSE_ID
            }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to add shop');
    }
  }
}
