import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cursor_agent_sample/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('Counter Widget Golden Tests', () {
    goldenTest(
      'renders correctly in initial state',
      fileName: 'signals_counter_initial',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'light theme',
            constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
            child: MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.teal,
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'Golden Test Sample Home Page'),
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'renders correctly after increment',
      fileName: 'signals_counter_incremented',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'light theme',
            constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
            onPumpWidget: (tester, widget) async {
              await tester.pumpWidget(widget);
              await tester.tap(find.byType(FloatingActionButton));
              await tester.pump();
            },
            child: MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.teal,
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'Golden Test Sample Home Page'),
            ),
          ),
        ],
      ),
    );
  });
}
