import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (_) => LoginPage(),
  HomePage.routeName: (_) => HomePage(),
  AddShopPage.routeName: (_) => AddShopPage()
};
