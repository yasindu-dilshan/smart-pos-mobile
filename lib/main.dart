import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/cartModel.dart';
import 'package:smart_pos_mobile/data/salesModel.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';
import 'package:smart_pos_mobile/routes.dart';
import 'package:smart_pos_mobile/services/auth_service.dart';
import 'package:smart_pos_mobile/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<AuthService>(
        create: (_) => AuthService(),
      ),
      ChangeNotifierProvider(create: (context) => CartModel()),
      ChangeNotifierProvider(create: (context) => SalesModel()),
      ChangeNotifierProvider(create: (context) => SalespersonModel()),
    ],
    child: SmartPOSApp(),
  ));
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
