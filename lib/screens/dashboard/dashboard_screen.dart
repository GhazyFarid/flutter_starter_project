import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/dashboard_provider.dart';
import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';
import 'tabs/settings_tab.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const List<Widget> _tabs = [HomeTab(), ProfileTab(), SettingsTab()];

  static const List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(dashboardTabProvider);
    final tabNotifier = ref.read(dashboardTabProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(_items[currentIndex].label!),
        centerTitle: true,
      ),
      body: _tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: _items,
        onTap: (index) => tabNotifier.state = index,
      ),
    );
  }
}
