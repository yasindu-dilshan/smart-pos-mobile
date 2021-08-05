import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homePage";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("POS App"),
        ),
        body: Stack(
          children: [
            Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter, image: AssetImage(''))),
            ),
            SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          primary: false,
                          crossAxisCount: 2,
                          children: [
                            MenuCard(
                                asset: "assets/images/box.png",
                                text: "Create Order"),
                            MenuCard(
                                asset: "assets/images/checklist.png",
                                text: "View Orders"),
                            MenuCard(
                                asset: "assets/images/shop.png",
                                text: "Add Shop"),
                            MenuCard(
                                asset: "assets/images/map.png",
                                text: "Daily Shops"),
                            MenuCard(
                                asset: "assets/images/question.png",
                                text: "Request Leave"),
                            MenuCard(
                                asset: "assets/images/clipboard.png",
                                text: "View Leaves"),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
