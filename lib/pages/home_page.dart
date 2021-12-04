import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';
import 'package:smart_pos_mobile/pages/map_page.dart';
import 'package:smart_pos_mobile/pages/add_leave_page.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';
import 'package:smart_pos_mobile/pages/view_orders_page.dart';
import 'package:smart_pos_mobile/pages/view_shops_page.dart';
import 'package:smart_pos_mobile/services/auth_service.dart';
import 'package:smart_pos_mobile/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePag';
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ' + sModel.getSalespersonName(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        routeName: ViewOrdersPage.routeName,
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
    );
  }
}
