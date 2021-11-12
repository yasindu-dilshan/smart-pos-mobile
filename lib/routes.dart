import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/bottom_navigation_page.dart';
import 'package:smart_pos_mobile/pages/cart.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';
import 'package:smart_pos_mobile/pages/map_page.dart';
import 'package:smart_pos_mobile/pages/add_leave_page.dart';
import 'package:smart_pos_mobile/pages/profile_page.dart';
import 'package:smart_pos_mobile/pages/shop_home_page.dart';
import 'package:smart_pos_mobile/pages/stock_page.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';
import 'package:smart_pos_mobile/pages/view_orders_page.dart';
import 'package:smart_pos_mobile/pages/view_shops_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (_) => LoginPage(),
  HomePage.routeName: (_) => HomePage(),
  AddShopPage.routeName: (_) => AddShopPage(),
  RequestLeavePage.routeName: (_) => RequestLeavePage(),
  ViewLeavePage.routeName: (_) => ViewLeavePage(),
  MapPage.routeName: (_) => MapPage(),
  ViewShopPage.routeName: (_) => ViewShopPage(),
  ShopHomePage.routeName: (_) => ShopHomePage(),
  BottomNavigationPage.routeName: (_) => BottomNavigationPage(),
  StockPage.routeName: (_) => StockPage(),
  CartPage.routeName: (_) => CartPage(),
  ProfilePage.routeName: (_) => ProfilePage(),
  ViewOrdersPage.routeName: (_) => ViewOrdersPage()
};
