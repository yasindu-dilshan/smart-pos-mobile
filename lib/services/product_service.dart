import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class ProductService {
  static Future<List<StockProduct>?> getOneProduct(
      String? id, String? productId, String token) async {
    if (id != null) {
      try {
        final response = await http.get(
          Uri.parse('${Config.BACKEND_URL}/salesperson/dailyProducts/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          return jsonDecode(response.body)['result']['dailyProducts']
              .map<StockProduct>((data) {
            var stockProduct = StockProduct.fromJSON(data);
            return stockProduct;
          }).toList();
        }
      } catch (e) {
        throw Exception('Failed to load the one product');
      }
    }
  }
}
