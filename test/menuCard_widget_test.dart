import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_pos_mobile/widgets/menu_card.dart';

void main() {
  testWidgets('MenuCard has asset, text and route Name', (WidgetTester tester) async {
    await tester.pumpWidget(const MenuCard(asset: 'assets/images/box.png',
        text: 'text',
        routeName: '/loginPage'));

    final assetFinder = find.byWidget(Image(image: AssetImage('assets/images/box.png'),));
    final textFinder = find.text('text');
    final routeNameFinder = find.text('/loginPage');

    expect(assetFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
    expect(routeNameFinder, findsOneWidget);

  });
}