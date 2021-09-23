import 'dart:core';

class Config {
  // ignore: constant_identifier_names
  static const String BACKEND_URL = String.fromEnvironment('BACKEND_URL',
      defaultValue: 'https://smart-pos-backend.herokuapp.com/api/');
  static const String USER_ID = String.fromEnvironment('USER_ID',
      defaultValue: '61364263017b454634bf0b9b');
  static const String WAREHOUSE_ID = String.fromEnvironment('WAREHOUSE_ID',
      defaultValue: '61364110017b454634bf0b99');
}
