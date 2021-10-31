import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/salesperson.dart';

class SalespersonModel extends ChangeNotifier {
  late Salesperson _salesperson;
  late String _token;

  void assignedSalesperson(Salesperson salesperson) {
    _salesperson = salesperson;
    notifyListeners();
  }
  void assignedToken(String token){
    _token = token;
    notifyListeners();
  }

  String getSalespersonName() {
    return _salesperson.firstName;
  }

  String getSalespersonId() {
    return _salesperson.id;
  }

  String getWarehouseId() {
    return _salesperson.warehouseId;
  }
}
