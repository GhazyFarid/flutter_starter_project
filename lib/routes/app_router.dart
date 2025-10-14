import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_project/screens/landing_screen.dart';
import 'package:flutter_starter_project/screens/login_screen.dart';
import 'package:flutter_starter_project/screens/register_screen.dart';
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
    ],
  );
});
