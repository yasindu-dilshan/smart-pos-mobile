import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';
import 'dart:collection';

class StockModel extends ChangeNotifier {
  List<StockProduct> _stock = [];

  void addStockProduct(StockProduct stockProduct) {
    _stock.add(stockProduct);
    notifyListeners();
  }

  int get stockCount {
    return _stock.length;
  }

  void add(StockProduct stockProduct) {
    _stock.add(stockProduct);
    notifyListeners();
  }
}
