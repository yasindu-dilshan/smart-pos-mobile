import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/leave.dart';
import 'package:smart_pos_mobile/services/leave_service.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({required this.leave});
  final Leave leave;

  @override
  Widget build(BuildContext context) {
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
              LeaveService.deleteLeave(leave.id);
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
