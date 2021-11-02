import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smart_pos_mobile/data/leave.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/pages/bottom_navigation_page.dart';
import 'package:smart_pos_mobile/services/leave_service.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({required this.leave});
  final Leave leave;


  Future createAlertDialog(BuildContext context, SalespersonModel sModel) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  LeaveService.deleteLeave(leave.id, sModel.getUserToken());
                  Navigator.popUntil(context, ModalRoute.withName(BottomNavigationPage.routeName));
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  'Yes',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  'No',
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
    return Card(
        child: leave.approved == 'approved' ?
        Row(children: [
          Expanded(
            child: ListTile(
              title: Text(
                leave.description,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                  leave.from.substring(0, 10) + ' to ' + leave.to.substring(0, 10)),
              trailing: Icon(
                Icons.assignment_turned_in_outlined,
                color: Colors.green,
              )
            ),
          ),
        ]) :
        Row(children: [
          Expanded(
            child: ListTile(
              title: Text(
                leave.description,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                  leave.from.substring(0, 10) + ' to ' + leave.to.substring(0, 10)),
              trailing: Icon(
                Icons.warning_outlined,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          TextButton(
            onPressed: ()  {
              createAlertDialog(context, sModel);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ]),
    );
  }
}
