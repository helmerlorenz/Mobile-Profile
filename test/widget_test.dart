import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/main.dart';

void main() {
  testWidgets('Profile app loads properly', (WidgetTester tester) async {
    // Build our profile app and trigger a frame.
    await tester.pumpWidget(const MyProfileApp());

    // Verify that name text appears on screen.
    expect(find.text('Jane Doe'), findsOneWidget);
  });
}
