import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/data/cartModel.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/pages/new_invoice_page.dart';
import 'package:smart_pos_mobile/pages/sales_page.dart';
import 'package:smart_pos_mobile/pages/view_shop_details_page.dart';
import 'package:smart_pos_mobile/services/product_service.dart';

class ShopHomeArguments {
  ShopHomeArguments({required this.shop});
  final Shop shop;
}

class ShopHomePage extends StatelessWidget {
  static const routeName = '/shopHomePage';
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    final args =
        ModalRoute.of(context)!.settings.arguments as ShopHomeArguments;
    final shop = args.shop;

    // Barcode scanning function
    Future<void> scan() async {
      var id = await FlutterBarcodeScanner.scanBarcode(
          '#000000', 'Cancel', true, ScanMode.BARCODE);
      var productList =
          await ProductService.getOneProduct(sModel.getSalespersonId(), id);
      for (var i = 0; i < productList!.length; i++) {
        var product = productList[i];
        if (product.id == id) {
          if (!Provider.of<CartModel>(context, listen: false)
              .isCartProductIn(product.id)) {
            var cartProduct = CartProduct(
                id: product.id,
                name: product.name,
                uniPrice: product.unitPrice,
                stockQuantity: product.quantity,
                selectedQuantity: 0,
                photo: product.photo,
                sales: product.sales);
            Provider.of<CartModel>(context, listen: false).add(cartProduct);
          }
        }
      }
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
                  text: 'Details',
                ),
                Tab(
                  text: 'Sales',
                ),
                Tab(
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
