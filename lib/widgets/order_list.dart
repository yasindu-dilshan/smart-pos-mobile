import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/salespersonOrder.dart';
import 'package:smart_pos_mobile/widgets/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({required this.orders});
  final List<SalespersonOrder> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        return OrderCard(order: order);
      },
    );
  }
}
