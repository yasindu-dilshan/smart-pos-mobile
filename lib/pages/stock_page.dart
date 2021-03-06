import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/stockProduct.dart';
import 'package:smart_pos_mobile/services/stockProduct_service.dart';
import 'package:provider/provider.dart';

class StockPage extends StatelessWidget {
  static const routeName = '/stockPage';
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(children: [
          Text(
            'Stock In Hand',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder(
                future: StockProductService.getStockProducts(
                    sModel.getSalespersonId(), sModel.getUserToken()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Please Try Again!'),
                    );
                  } else if (snapshot.hasData) {
                    var stockProducts = snapshot.data as List<StockProduct>;
                    var rows = <TableRow>[];
                    rows.add(TableRow(children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.black54),
                        height: 38,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 38,
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.black54),
                        child: Text(
                          'Unit Price',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 38,
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.black54),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]));
                    for (var i = 0; i < stockProducts.length; i++) {
                      rows.add(TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: Text(
                              stockProducts[i].name,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: Text(
                              'Rs. ' + stockProducts[i].unitPrice.toString(),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: Text(
                              (stockProducts[i].quantity -
                                      stockProducts[i].sales)
                                  .toString(),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ]));
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
                }),
          ),
        ]),
      ),
    );
  }
}
