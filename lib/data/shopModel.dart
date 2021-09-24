import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class ShopModel extends ChangeNotifier {
  List<Shop> _items = [];
  UnmodifiableListView<Shop> get items => UnmodifiableListView(_items);

  // int get totalPrice => _items.length * 42;
  int get count => _items.length;

  void add(Shop shop) {
    _items.add(shop);
    notifyListeners();
  }

  Shop getByIndex(int index) {
    return _items[index];
  }

  void remove(Shop shop) {
    _items.remove(shop);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
