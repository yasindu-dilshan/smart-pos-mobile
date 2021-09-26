import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/config.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/data/salespersonOrder.dart';
import 'package:smart_pos_mobile/services/order_service.dart';
import 'package:smart_pos_mobile/widgets/order_list.dart';
import 'package:smart_pos_mobile/widgets/rounded_input.dart';
import 'package:provider/provider.dart';

class ViewOrdersPage extends StatelessWidget {
  static const routeName = '/ViewOrdersPage';
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RoundedInput(
                size: size,
                icon: Icons.search,
                hintText: 'Search',
                controller: null,
              ),
              FutureBuilder(
                future: OrderService.getOrdersOfOneSalesperson(
                    sModel.getSalespersonId()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text('Error'),
                    );
                  } else if (snapshot.hasData) {
                    var orders = snapshot.data as List<SalespersonOrder>?;
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: orders != null
                          ? OrderList(orders: orders)
                          : Text('Nothing to show here'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
