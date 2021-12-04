import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/leave.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/services/leave_service.dart';
import 'package:smart_pos_mobile/widgets/leave_list.dart';
import 'package:provider/provider.dart';

class ViewLeavePage extends StatelessWidget {
  static const routeName = '/ViewLeavePage';
  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaves'),
      ),
      body: FutureBuilder(
          future: LeaveService.getAllLeaves(sModel.getSalespersonId(), sModel.getUserToken()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              var leaves = snapshot.data as List<Leave>?;
              return Container(
                padding: const EdgeInsets.all(10),
                child: leaves != null
                    ? LeaveList(leaves: leaves)
                    : const Text('Nothing to show here'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
