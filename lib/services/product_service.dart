import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class ProductService {
  static Future<StockProduct?> getOneProduct(String? id) async {
    final response = await http
        .get(Uri.parse('${Config.BACKEND_URL}/salesperson/product/$id'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return StockProduct.fromJSON(jsonDecode(response.body)['result']);
    }
  }
}
