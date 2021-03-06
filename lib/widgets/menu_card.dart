import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/pages/add_shop_page.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {Key? key,
      required this.asset,
      required this.text,
      required this.routeName})
      : super(key: key);

  final String asset;
  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                asset,
              ),
              height: 125,
            ),
            Text(text,textDirection: TextDirection.ltr)
          ],
        ),
      ),
    );
  }
}
