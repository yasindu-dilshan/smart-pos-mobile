import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/widgets/shop_card.dart';

class ShopList extends StatelessWidget {
  const ShopList({required this.shops});
  final List<Shop> shops;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shops.length,
      itemBuilder: (context, index) {
        var shop = shops[index];
        return ShopCard(shop: shop);
      },
    );
  }
}
