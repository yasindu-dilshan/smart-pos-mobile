import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/order.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';

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
}
