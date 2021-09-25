import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/order.dart';
import 'package:smart_pos_mobile/data/salespersonOrder.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/pages/shop_home_page.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order});
  final SalespersonOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // Navigator.of(context).pushNamed(ShopHomePage.routeName,
          //     arguments: ShopHomeArguments(shop: shop));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          order.date.substring(0, 10),
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          'Shop: ' +
              order.shopName +
              ' | Total : Rs. ' +
              order.totalPrice.toString(),
        ),
        trailing: Icon(
          Icons.forward,
          color: Colors.blue,
        ),
      ),
    );
  }
}
