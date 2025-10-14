import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/dashboard_provider.dart';
import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';
import 'tabs/settings_tab.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  final List<Widget> _tabs = const [HomeTab(), ProfileTab(), SettingsTab()];

  static const List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Profile',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(dashboardTabProvider);
    final tabNotifier = ref.read(dashboardTabProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _destinations[currentIndex].label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // Rebuild penuh
      // body: AnimatedSwitcher(
      //   duration: const Duration(milliseconds: 250),
      //   switchInCurve: Curves.easeIn,
      //   switchOutCurve: Curves.easeOut,
      //   child: _tabs[currentIndex],
      // ),
      // Tidak rebuild (menyimpan state tiap tab yang dibuka)
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: IndexedStack(
          key: ValueKey(currentIndex), // penting agar animasi terpicu
          index: currentIndex,
          children: _tabs,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: tabNotifier.setTab,
        destinations: _destinations,
        indicatorColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.2),
      ),
    );
  }
}
