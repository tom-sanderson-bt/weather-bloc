import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {"city name"} input
Future<void> iSeeInput(WidgetTester tester, String text) async {
  expect(find.bySemanticsLabel(text), findsOneWidget);
}
