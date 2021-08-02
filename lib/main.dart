import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';
import 'package:smart_pos_mobile/routes.dart';
import 'package:smart_pos_mobile/theme.dart';

void main() {
  runApp(SmartPOSApp());
}

class SmartPOSApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: routes,
      home: LoginPage(),
    );
  }
}
