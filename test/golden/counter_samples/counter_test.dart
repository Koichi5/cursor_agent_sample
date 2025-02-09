import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cursor_agent_sample/main.dart';

void main() {
  testWidgets('Counter Golden Test - Initial State', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await expectLater(
      find.byType(MyHomePage),
      matchesGoldenFile('goldens/signals_counter_initial.png'),
    );
  });

  testWidgets('Counter Golden Test - After Increment', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    await expectLater(
      find.byType(MyHomePage),
      matchesGoldenFile('goldens/signals_counter_incremented.png'),
    );
  });
}