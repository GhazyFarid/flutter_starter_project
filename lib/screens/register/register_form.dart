import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_project/providers/register_providers.dart';
import 'package:flutter_starter_project/widgets/custom_text_field.dart';
import 'package:flutter_starter_project/widgets/password_text_field.dart';
import 'package:flutter_starter_project/widgets/primary_button.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final notifier = ref.read(registerNotifierProvider.notifier);

    return SingleChildScrollView(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Fill your details to register',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // name
              CustomTextField(
                label: 'Full Name',
                onChanged: notifier.setEmail,
                keyboardType: TextInputType.name,
                prefixIcon: Icons.person_outline,
              ),

              const SizedBox(height: 16),

              // email
              CustomTextField(
                label: 'Email',
                onChanged: notifier.setEmail,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 16),

              // phone
              CustomTextField(
                label: 'Phone',
                onChanged: notifier.setPhone,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_android_outlined,
              ),

              const SizedBox(height: 16),

              // password
              PasswordTextField(
                label: "Password",
                onChanged: notifier.setPassword,
                prefixIcon: Icons.password_outlined,
              ),

              const SizedBox(height: 16.0),

              // Re Password
              PasswordTextField(
                label: 'Repeat Password',
                onChanged: notifier.setRePassword,
                prefixIcon: Icons.password_outlined,
              ),

              const SizedBox(height: 16),

              // Error Message
              if (state.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Register',
                  onPressed: () => notifier.register(),
                  isLoading: state.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
