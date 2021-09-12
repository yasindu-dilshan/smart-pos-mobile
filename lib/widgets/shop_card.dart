import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/pages/shop_home_page.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({required this.shop});
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(ShopHomePage.routeName,
              arguments: ShopHomeArguments(shop: shop));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          shop.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          shop.ownerName,
        ),
        trailing: Icon(
          Icons.forward,
          color: Colors.blue,
        ),
      ),
    );
  }
}
