import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';

class CartModel extends ChangeNotifier {
  List<CartProduct> _items = [];
  UnmodifiableListView<CartProduct> get items => UnmodifiableListView(_items);

  // int get totalPrice => _items.length * 42;
  int get count => _items.length;

  int? totalPrice() {
    var total = 0;
    for (var i = 0; i < count; i++) {
      total += getByIndex(i).uniPrice * getByIndex(i).selectedQuantity;
    }
    return total;
  }

  List? getProducts() {
    var products = [];
    for (var i = 0; i < count; i++) {
      products.add({
        'product': getByIndex(i).id,
        'quantity': getByIndex(i).selectedQuantity
      });
    }
    return products;
  }

  void add(CartProduct cartProduct) {
    _items.add(cartProduct);
    notifyListeners();
  }

  void increaseSelectedQuantity(int index) {
    if (getByIndex(index).selectedQuantity < getByIndex(index).stockQuantity) {
      getByIndex(index).selectedQuantity += 1;
    }
    notifyListeners();
  }

  void decreaseSelectedQuantity(int index) {
    if (getByIndex(index).selectedQuantity > 0) {
      getByIndex(index).selectedQuantity -= 1;
    }
    notifyListeners();
  }

  CartProduct getByIndex(int index) {
    return _items[index];
  }

  bool isCartProductIn(String id) {
    for (var i = 0; i < count; i++) {
      if (_items[i].id == id) {
        return true;
      }
    }
    return false;
  }

  void remove(CartProduct cartProduct) {
    _items.remove(cartProduct);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
