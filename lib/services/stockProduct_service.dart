import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class StockProductService {
  static Future<List<StockProduct>?> getStockProducts(String? id) async {
    if (id != null) {
      final response = await http
          .get(Uri.parse('${Config.BACKEND_URL}salesperson/dailyProducts/$id'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body)['result']['dailyProducts']
            .map<StockProduct>((data) {
          var stockProduct = StockProduct.fromJSON(data);

          return stockProduct;
        }).toList();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load the stock products');
      }
    }
  }
}
