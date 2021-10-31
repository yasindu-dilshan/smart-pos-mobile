import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/pages/login_page.dart';
import 'package:smart_pos_mobile/pages/stock_page.dart';
import 'package:smart_pos_mobile/services/auth_service.dart';

class BottomNavigationPage extends StatefulWidget {
  static const routeName = '/bottomNavigationPage';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    StockPage(),
  ];

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  Future createAlertDialog(BuildContext context, authService) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.popUntil(context, ModalRoute.withName(LoginPage.routeName));
                  await Navigator.of(context).pushNamed(LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  'Yes',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  'No',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          );
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // updateShopModel(Config.USER_ID);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SMART POS'),
            TextButton(
              onPressed: () {
                createAlertDialog(context, authService);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: BottomNavigationPage._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Stock',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
