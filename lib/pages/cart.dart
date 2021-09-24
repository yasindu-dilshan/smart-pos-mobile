import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/cartModel.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/services/order_service.dart';

import '../config.dart';

class CartArguments {
  CartArguments({required this.shop});
  final Shop shop;
}

class CartPage extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CartArguments;
    final shop = args.shop;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: _CartList(),
                ),
              ),
              Divider(height: 4, color: Colors.black),
              _CartTotal(shop: shop),
            ],
          ),
        ));
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    var rows = <TableRow>[];

    for (var i = 0; i < cart.count; i++) {
      var cartProduct = cart.getByIndex(i);
      rows.add(
        TableRow(
          children: [
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                cartProduct.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                'Rs. ' + cartProduct.uniPrice.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                cartProduct.selectedQuantity.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () {
                  cart.increaseSelectedQuantity(i);
                },
                child: Icon(Icons.add),
              ),
            ),
            FractionallySizedBox(
              widthFactor: .8,
              child: ElevatedButton(
                onPressed: () {
                  cart.decreaseSelectedQuantity(i);
                },
                child: Icon(Icons.remove),
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    cart.remove(cartProduct);
                  },
                  child: Icon(Icons.delete),
                )),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Table(
        children: rows,
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({required this.shop});
  final Shop shop;

  Future createAlertDialog(
      BuildContext context, CartModel cart, Shop shop, List products) {
    var totalPrice = cart.totalPrice();
    var controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Total Price: Rs. $totalPrice'),
            content: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Received Amount',
              ),
              controller: controller,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  var a = OrderService.addOrder(
                      products: products,
                      shop: shop.id,
                      salesperson: '${Config.USER_ID}',
                      totalPrice: totalPrice,
                      receivedPrice: int.parse(controller.text));
                  cart.removeAll();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  'CANCEL',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Consumer<CartModel>(
                  builder: (context, cart, child) => Text(
                    ' Rs. ' + cart.totalPrice().toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.open_in_new),
              onPressed: () {
                var products = cart.getProducts();
                createAlertDialog(context, cart, shop, products!);
                // print(products);
              },
              label: Text(
                'Generate Invoice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
