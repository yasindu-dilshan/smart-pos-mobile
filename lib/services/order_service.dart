import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/order.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/salespersonOrder.dart';

class OrderService {
  static Future<List<Order>?> getOrderOfOneShop(String? id) async {
    if (id != null) {
      final response = await http.get(
          Uri.parse('${Config.BACKEND_URL}salesperson/ordersOfOneShop/$id'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body)['result'].map<Order>((data) {
          return Order.fromJSON(data);
        }).toList();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load the orders');
      }
    }
  }

  static Future<List<SalespersonOrder>?> getOrdersOfOneSalesperson(
      String? id) async {
    if (id != null) {
      final response = await http.get(Uri.parse(
          '${Config.BACKEND_URL}salesperson/ordersOfOneSalesperson/$id?sortBy=+createdAt'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body)['result']
            .map<SalespersonOrder>((data) {
          return SalespersonOrder.fromJSON(data);
        }).toList();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load the orders');
      }
    }
  }

  static void addOrder(
      {required List? products,
      required String? shop,
      required String? salesperson,
      required int? totalPrice,
      required int? receivedPrice}) async {
    final response =
        await http.post(Uri.parse('${Config.BACKEND_URL}salesperson/order'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'products': products,
              'shop': shop,
              'salesperson': salesperson,
              'totalPrice': totalPrice,
              'receivedPrice': receivedPrice
            }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Done');
      return;
    } else {
      print(response.statusCode);
      return;
    }
  }

  static void updateDueAmount(String? id, int? receivedPrice) async {
    final response = await http.patch(
      Uri.parse('${Config.BACKEND_URL}salesperson/updateDue/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int?>{
        'receivedPrice': receivedPrice,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
    } else {
      print(response.body);
    }
  }
}
