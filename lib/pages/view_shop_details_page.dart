import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/shop.dart';

class ViewShopDetailsPage extends StatelessWidget {
  ViewShopDetailsPage({required this.shop});
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    print(shop.id);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            shop.name,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Owner Name :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            shop.ownerName,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: Colors.blue),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Contact Number (Owner) :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            shop.telephone,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: Colors.blue),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Email :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            shop.email,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: Colors.blue),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'address :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            shop.address,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
