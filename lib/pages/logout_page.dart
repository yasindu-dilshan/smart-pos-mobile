import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_pos_mobile/services/auth_service.dart';

class LogoutPage extends StatelessWidget {
  Future createAlertDialog(BuildContext context, authService) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.pop(context);
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
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                createAlertDialog(context, authService);
              },
              child: Text('LOG OUT'),
            ),
          )
        ],
      ),
    );
  }
}
