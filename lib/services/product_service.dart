import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class ProductService {
  static Future<List<StockProduct>?> getOneProduct(
      String? id, String? productId) async {
    if (id != null) {
      try {
        final response = await http.get(
            Uri.parse('${Config.BACKEND_URL}/salesperson/dailyProducts/$id'));
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body)['result']['dailyProducts'][0]
                  ['product']['_id'] ==
              productId);
          return jsonDecode(response.body)['result']['dailyProducts']
              .map<StockProduct>((data) {
            print('gg');

            var stockProduct = StockProduct.fromJSON(data);
            return stockProduct;
          }).toList();
        }
      } catch (e) {
        print('ggggggggggggggggggg');
        print(e);
      }
    }
  }
}
