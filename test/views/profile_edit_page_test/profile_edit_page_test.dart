import 'package:alchemist/alchemist.dart';
import 'package:cursor_agent_sample/views/profile_edit_page/profile_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/alchemist/golden_test_device_scenario.dart';

void main() {
  group('ProfileEditPage Golden Test', () {
    Widget buildMyApp() {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
        home: const ProfileEditPage(title: 'プロフィール編集'),
      );
    }

    final phonePortrait = Device.phonePortrait;

    goldenTest(
      'Default',
      fileName: 'profile_edit_page_default',
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
