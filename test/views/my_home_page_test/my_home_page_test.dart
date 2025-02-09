import 'package:alchemist/alchemist.dart';
import 'package:cursor_agent_sample/views/my_home_page/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';

@Tags(['golden'])
void main() {
  group('MyHomePage Golden Test', () {
    Widget buildMyApp() {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
        home: const MyHomePage(title: 'Flutter Demo'),
      );
    }

    // すべてのデバイス
    // final allDevices = Device.all;

    // デフォルトのデバイス
    final phonePortrait = Device.phonePortrait;

    goldenTest(
      'Default',
      fileName: 'my_app_default',
      builder: () {
        return GoldenTestGroup(
          columns: 1,
          children: [
            GoldenTestDeviceScenario(
              name: phonePortrait.name,
              device: phonePortrait,
              builder: () => buildMyApp(),
            ),
          ],
        );
      },
    );
  });
}
