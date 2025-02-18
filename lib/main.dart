import 'package:flutter/material.dart';
import 'package:cursor_agent_sample/views/my_home_page/my_home_page.dart';
import 'package:cursor_agent_sample/views/profile_page/profile_page.dart';
import 'package:cursor_agent_sample/views/settings_page/settings_page.dart';
import 'package:cursor_agent_sample/views/notification_page/notification_page.dart';
import 'package:cursor_agent_sample/views/project_overview_page/project_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(title: 'Flutter Demo'),
    const ProjectOverviewPage(),
    const NotificationPage(title: '通知'),
    const ProfilePage(title: 'プロフィール'),
    const SettingsPage(title: '設定'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            label: 'ホーム',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.assessment_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.assessment_rounded,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            label: 'プロジェクト',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.notifications_rounded,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            label: '通知',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            label: 'プロフィール',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.settings_rounded,
              color: theme.colorScheme.onSecondaryContainer,
            ),
            label: '設定',
          ),
        ],
      ),
    );
  }
}
