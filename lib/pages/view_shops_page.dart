import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/services/shop_service.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';
import 'package:smart_pos_mobile/widgets/shop_list.dart';

class ViewShopPage extends StatelessWidget {
  static const routeName = '/ViewShopPage';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sModel = context.watch<SalespersonModel>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Shops'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: ShopService.getAllShops(sModel.getUserToken()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {

                    return Center(
                      child: Text('Error'),
                    );
                  } else if (snapshot.hasData) {
                    var shops = snapshot.data as List<Shop>?;
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: shops != null
                          ? ShopList(shops: shops)
                          : Text('Nothing to show here'),
                    );
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
