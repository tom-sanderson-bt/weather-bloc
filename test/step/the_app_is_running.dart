import 'package:flutter_test/flutter_test.dart';
import 'package:open_weather_bloc/main.dart';
import 'package:open_weather_bloc/core/services/injection.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await sl.reset();
  await initDI();
  await tester.pumpWidget(const MyApp());
}
