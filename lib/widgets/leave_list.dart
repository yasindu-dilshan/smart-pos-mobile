import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/leave.dart';
import 'package:smart_pos_mobile/widgets/leave_card.dart';

class LeaveList extends StatelessWidget {
  const LeaveList({required this.leaves});
  final List<Leave> leaves;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: leaves.length,
        itemBuilder: (context, index) {
          var leave = leaves[index];
          return LeaveCard(leave: leave);
        });
  }
}
