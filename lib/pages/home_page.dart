import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';
import 'package:smart_pos_mobile/pages/bottom_navigation_page.dart';
import 'package:smart_pos_mobile/pages/map_page.dart';
import 'package:smart_pos_mobile/pages/add_leave_page.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';
import 'package:smart_pos_mobile/pages/view_shops_page.dart';
import 'package:smart_pos_mobile/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePag';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('POS App'),
        // ),
        body: Stack(
      children: [
        Container(
          height: size.height * .3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter, image: AssetImage(''))),
        ),
        SafeArea(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: [
                        MenuCard(
                          asset: 'assets/images/box.png',
                          text: 'Create Order',
                          routeName: ViewShopPage.routeName,
                        ),
                        MenuCard(
                          asset: 'assets/images/checklist.png',
                          text: 'View Orders',
                          routeName: AddShopPage.routeName,
                        ),
                        MenuCard(
                          asset: 'assets/images/shop.png',
                          text: 'Add Shop',
                          routeName: AddShopPage.routeName,
                        ),
                        MenuCard(
                          asset: 'assets/images/map.png',
                          text: 'Daily Shops',
                          routeName: MapPage.routeName,
                        ),
                        MenuCard(
                          asset: 'assets/images/question.png',
                          text: 'Request Leave',
                          routeName: RequestLeavePage.routeName,
                        ),
                        MenuCard(
                          asset: 'assets/images/clipboard.png',
                          text: 'View Leaves',
                          routeName: ViewLeavePage.routeName,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    ));
  }
}
