import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/services/shop_service.dart';
import 'package:smart_pos_mobile/widgets/shop_list.dart';

class ViewShopPage extends StatelessWidget {
  static const routeName = '/ViewShopPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shops'),
        ),
        body: FutureBuilder(
          future: ShopService.getAllShops(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              var shops = snapshot.data as List<Shop>?;
              return Container(
                padding: EdgeInsets.all(10),
                child: shops != null
                    ? ShopList(shops: shops)
                    : Text('Nothing to show here'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
