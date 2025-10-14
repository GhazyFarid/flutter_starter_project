import 'package:flutter/material.dart';
import 'package:flutter_starter_project/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to My App',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  text: 'Login',
                  onPressed: () => context.push('/login'),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'Register',
                  onPressed: () => context.push('/register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
