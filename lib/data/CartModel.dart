import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class CartModel extends ChangeNotifier {
  final List<StockProduct> _items = [];

  UnmodifiableListView<StockProduct> get items => UnmodifiableListView(_items);

  // int get totalPrice => _items.length * 42;
  int get count => _items.length;

  void add(StockProduct stockProduct) {
    _items.add(stockProduct);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
