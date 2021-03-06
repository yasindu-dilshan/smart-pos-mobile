import 'package:location/location.dart';
import 'package:smart_pos_mobile/data/order.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/salespersonOrder.dart';

class OrderService {
  static Future<List<Order>?> getOrderOfOneShop(String? id, String token) async {
    if (id != null) {
      final response = await http.get(
          Uri.parse('${Config.BACKEND_URL}salesperson/ordersOfOneShop/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body)['result'].map<Order>((data) {
          return Order.fromJSON(data);
        }).toList();
      } else {
        throw Exception('Failed to load the orders');
      }
    }
  }

  static Future<List<SalespersonOrder>?> getOrdersOfOneSalesperson(
      String? id, String token) async {
    if (id != null) {
      final response = await http.get(Uri.parse(
          '${Config.BACKEND_URL}salesperson/ordersOfOneSalesperson/$id?sortBy=+createdAt'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body)['result']
            .map<SalespersonOrder>((data) {
          return SalespersonOrder.fromJSON(data);
        }).toList();
      } else {
        throw Exception('Failed to load the orders');
      }
    }
  }

  static void addOrder(
      {required List? products,
      required String? shop,
      required String? salesperson,
      required int? totalPrice,
      required int? receivedPrice,
      required String token}) async {
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/order'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, dynamic>{
              'products': products,
              'shop': shop,
              'salesperson': salesperson,
              'totalPrice': totalPrice,
              'receivedPrice': receivedPrice
            }));
    if (response.statusCode == 200 || response.statusCode == 201) {
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

      final response1 = await http.patch(Uri.parse('${Config.BACKEND_URL}users/updateLocation/$salesperson'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'longitude': _locationData.longitude.toString(),
            'latitude': _locationData.latitude.toString()
          }));
      if(response1.statusCode == 200 || response1.statusCode == 201){
        print('Done');
        return;
      }else{
        return;
      }
    } else {
      return;
    }
  }

  static void updateDueAmount(String? id, int? receivedPrice, String token) async {
    final response = await http.patch(
      Uri.parse('${Config.BACKEND_URL}salesperson/updateDue/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, int?>{
        'receivedPrice': receivedPrice,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
    } else {
      throw Exception('Failed to update the due amount');
    }
  }
}
