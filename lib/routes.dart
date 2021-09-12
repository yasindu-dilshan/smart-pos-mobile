import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';
import 'package:smart_pos_mobile/pages/map_page.dart';
import 'package:smart_pos_mobile/pages/add_leave_page.dart';
import 'package:smart_pos_mobile/pages/shop_home_page.dart';
import 'package:smart_pos_mobile/pages/test.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';
import 'package:smart_pos_mobile/pages/view_shops_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (_) => LoginPage(),
  HomePage.routeName: (_) => HomePage(),
  AddShopPage.routeName: (_) => AddShopPage(),
  RequestLeavePage.routeName: (_) => RequestLeavePage(),
  ViewLeavePage.routeName: (_) => ViewLeavePage(),
  BasicDateField.routeName: (_) => BasicDateField(),
  MapPage.routeName: (_) => MapPage(),
  ViewShopPage.routeName: (_) => ViewShopPage(),
  ShopHomePage.routeName: (_) => ShopHomePage(),
};
