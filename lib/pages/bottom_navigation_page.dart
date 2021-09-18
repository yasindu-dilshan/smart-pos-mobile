import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/pages/stock_page.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';

class BottomNavigationPage extends StatefulWidget {
  static const routeName = '/bottomNavigationPage';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    StockPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMART POS'),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
