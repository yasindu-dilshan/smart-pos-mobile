import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/constants.dart';
import 'package:smart_pos_mobile/data/cartModel.dart';
import 'package:smart_pos_mobile/data/cartProduct.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';
import 'package:smart_pos_mobile/pages/cart.dart';
import 'package:smart_pos_mobile/services/stockProduct_service.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';

class NewInvoicePage extends StatelessWidget {
  NewInvoicePage({required this.shop});
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Cart Button
            CartButton(shop: shop, size: size),
            RoundedInput(
              size: size,
              icon: Icons.search,
              hintText: 'Search',
              controller: null,
            ),
            Items(),
          ],
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.shop,
    required this.size,
  }) : super(key: key);

  final Shop shop;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartPage.routeName,
                arguments: CartArguments(shop: shop));
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
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
          )),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return FutureBuilder(
        future: StockProductService.getStockProducts(sModel.getSalespersonId(), sModel.getUserToken()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            var stockProducts = snapshot.data as List<StockProduct>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.5,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20),
                  itemCount: stockProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    var product = stockProducts[index];
                    return TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black.withAlpha(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
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
                          Provider.of<CartModel>(context, listen: false)
                              .add(cartProduct);
                        }

                        print(Provider.of<CartModel>(context, listen: false)
                            .count);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue.shade900),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(child: Image.network(product.photo)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rs. ' + product.unitPrice.toString(),
                            style: TextStyle(color: Colors.blue.shade900),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
// InkWell(
// onTap: () {
// if (!Provider.of<CartModel>(context, listen: false)
//     .isCartProductIn(product.id)) {
// var cartProduct = CartProduct(
// id: product.id,
// name: product.name,
// uniPrice: product.unitPrice,
// stockQuantity: product.quantity,
// selectedQuantity: 0,
// photo: product.photo,
// );
// Provider.of<CartModel>(context, listen: false)
//     .add(cartProduct);
// }
//
// print(Provider.of<CartModel>(context, listen: false)
//     .count);
// },
// child: Container(
// decoration: BoxDecoration(
// color: Colors.black.withAlpha(15),
// borderRadius: BorderRadius.circular(15)),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// product.name,
// style: TextStyle(
// fontSize: 17, fontWeight: FontWeight.w500),
// ),
// SizedBox(
// height: 5,
// ),
// Expanded(child: Image.network(product.photo)),
// SizedBox(
// height: 5,
// ),
// Text('Rs. ' + product.unitPrice.toString())
// ],
// ),
// ),
// );
// FutureBuilder(
// future: ShopService.getAssignedShops(Config.USER_ID),
// builder: (context, snapshot){
// if(snapshot.hasError){
// print(snapshot.error);
// }else if (snapshot.hasData){
// var ShopList = snapshot.data as List<Shop>;
// }
// },
// )
