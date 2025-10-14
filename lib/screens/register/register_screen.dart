import 'package:flutter/material.dart';
import 'package:flutter_starter_project/screens/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Padding(padding: EdgeInsets.all(16.0), child: RegisterForm()),
    );
  }
}
