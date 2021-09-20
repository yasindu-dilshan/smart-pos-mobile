import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/CartModel.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
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
              _CartTotal(),
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
  @override
  Widget build(BuildContext context) {
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
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Buying not supported yet.')));
                },
                child: OutlinedButton.icon(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () {},
                  label: Text(
                    'Generate Invoice',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
