import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setTab(int index) => state = index;
}

final dashboardTabProvider = NotifierProvider<DashboardNotifier, int>(
  DashboardNotifier.new,
);
