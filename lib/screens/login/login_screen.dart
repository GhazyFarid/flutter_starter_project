import 'package:flutter/material.dart';
import 'package:flutter_starter_project/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(padding: EdgeInsets.all(16), child: LoginForm()),
    );
  }
}
