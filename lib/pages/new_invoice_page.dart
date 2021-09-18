import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/constants.dart';
import 'package:smart_pos_mobile/data/CartModel.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';
import 'package:smart_pos_mobile/services/stockProduct_service.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';

class NewInvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(
        10,
        (index) => {
              "id": index,
              "name": "Product $index",
              'price': '${100 * (index + 1)}'
            }).toList();
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Cart Button
            Container(
              padding: EdgeInsets.all(15),
              width: size.width * .8,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            RoundedInput(size: size, icon: Icons.search, hintText: 'Search'),
            FutureBuilder(
                future: StockProductService.getStockProducts(
                    '61364263017b454634bf0b9b'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text('Error'),
                    );
                  } else if (snapshot.hasData) {
                    var stockProducts = snapshot.data as List<StockProduct>;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 0),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 40,
                                  mainAxisSpacing: 20),
                          itemCount: stockProducts.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                print(stockProducts[index].name);
                                Provider.of<CartModel>(context, listen: false)
                                    .add(stockProducts[index]);
                                print(Provider.of<CartModel>(context,
                                        listen: false)
                                    .count);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(stockProducts[index].name),
                                    Text('Unit Price: Rs. ' +
                                        stockProducts[index]
                                            .unitPrice
                                            .toString())
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
