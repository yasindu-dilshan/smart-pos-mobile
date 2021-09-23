import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/pages/new_invoice_page.dart';
import 'package:smart_pos_mobile/pages/sales_page.dart';
import 'package:smart_pos_mobile/pages/view_shop_details_page.dart';

class ShopHomeArguments {
  ShopHomeArguments({required this.shop});
  final Shop shop;
}

class ShopHomePage extends StatelessWidget {
  static const routeName = '/shopHomePage';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ShopHomeArguments;
    final shop = args.shop;

    Future<void> scan() async {
      var a = await FlutterBarcodeScanner.scanBarcode(
          '#000000', 'Cancel', true, ScanMode.BARCODE);
      print(a);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await scan();
        },
        child: Icon(Icons.add),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(shop.name),
            bottom: TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Icons.details),
                  text: 'Details',
                ),
                Tab(
                  // icon: Icon(Icons.shopping_cart_outlined),
                  text: 'Sales',
                ),
                Tab(
                  // icon: Icon(Icons.add_shopping_cart_rounded),
                  text: 'New Invoice',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ViewShopDetailsPage(shop: shop),
              SalesPage(shop: shop),
              NewInvoicePage(shop: shop)
            ],
          ),
        ),
      ),
    );
  }
}
