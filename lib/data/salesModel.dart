import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:smart_pos_mobile/data/order.dart';

class SalesModel extends ChangeNotifier {
  List<Order> _items = [];
  UnmodifiableListView<Order> get items => UnmodifiableListView(_items);

  int get count => _items.length;

  void add(Order order) {
    _items.add(order);
    notifyListeners();
  }

  void updateDue(int index, int receivedPrice) {
    getByIndex(index).receivedPrice += receivedPrice;
    notifyListeners();
  }

  Order getByIndex(int index) {
    return _items[index];
  }
}
