import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smart_pos_mobile/data/order.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/shop.dart';
import 'package:smart_pos_mobile/services/order_service.dart';

class SalesPage extends StatelessWidget {
  SalesPage({required this.shop});
  final Shop shop;

  Future createAlertDialog(BuildContext context, var due, var id, SalespersonModel sModel) {
    var controller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Due Amount: $due'),
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
                  OrderService.updateDueAmount(id, int.parse(controller.text), sModel.getUserToken());
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  'UPDATE',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
    var sModel = context.watch<SalespersonModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: FutureBuilder(
        future: OrderService.getOrderOfOneShop(shop.id, sModel.getUserToken()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            var orders = snapshot.data as List<Order>?;

            var rows = <TableRow>[];
            rows.add(TableRow(children: [
              Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.black54),
                height: 38,
                child: Text(
                  'Date',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 38,
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.black54),
                child: Text(
                  'Total Price',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 38,
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.black54),
                child: Text(
                  'Due Amount',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ]));

            for (var i = 0; i < orders!.length; i++) {
              var due = orders[i].totalPrice - orders[i].receivedPrice;
              rows.add(
                TableRow(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        orders[i].date.substring(0, 10),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        'Rs. ' + orders[i].totalPrice.toString(),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Container(
                        height: 32,
                        alignment: Alignment.center,
                        child: due > 0
                            ? ElevatedButton(
                                onPressed: () {
                                  createAlertDialog(context, due, orders[i].id, sModel);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Text(
                                  'Rs. ' +
                                      (orders[i].totalPrice -
                                              orders[i].receivedPrice)
                                          .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                child: Text(
                                  'PAID',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              )),
                  ),
                ]),
              );
            }
            return Scrollbar(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      children: rows,
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
