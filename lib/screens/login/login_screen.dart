import 'package:flutter/material.dart';
import 'package:flutter_starter_project/screens/login/login_form.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Padding(padding: EdgeInsets.all(16), child: LoginForm()),
    );
  }
}
