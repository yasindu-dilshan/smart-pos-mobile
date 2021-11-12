import 'package:flutter_test/flutter_test.dart';
import 'package:smart_pos_mobile/main.dart';

void main() {
  testWidgets('Home', (tester) async {
    await tester.pumpWidget(SmartPOSApp());
  });
}
