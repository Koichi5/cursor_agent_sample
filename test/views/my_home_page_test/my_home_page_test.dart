import 'package:alchemist/alchemist.dart';
import 'package:cursor_agent_sample/views/my_home_page/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';

void main() {
  group('MyApp Golden Test', () {
    Widget buildMyApp() {
      return const MyHomePage(title: 'Flutter Demo');
    }

    // すべてのデバイス
    // final allDevices = Device.all;

    // デフォルトのデバイス
    final phonePortrait = Device.phonePortrait;

    goldenTest('Default', fileName: 'my_app_default', builder: () {
      final children = <Widget>[];

        children.add(GoldenTestDeviceScenario(
          name: phonePortrait.name,
          device: phonePortrait,
          builder: () => buildMyApp(),
        ));

      return GoldenTestGroup(
        columns: 1,
        children: children,
      );
    });
  });
}
