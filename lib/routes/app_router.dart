import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_project/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_starter_project/screens/landing_page/landing_screen.dart';
import 'package:flutter_starter_project/screens/login/login_screen.dart';
import 'package:flutter_starter_project/screens/register/register_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
});
