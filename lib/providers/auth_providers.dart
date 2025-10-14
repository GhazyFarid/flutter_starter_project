import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> login() async {
    final email = state.email.trim().toLowerCase();
    final password = state.password.trim();

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(errorMessage: "Email dan password wajib diisi");
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi delay login API
    await Future.delayed(const Duration(seconds: 2));

    // Misal: validasi sederhana
    if (email == "admin@gmail.com" && password == "123456") {
      state = state.copyWith(isLoading: false, errorMessage: 'Sukses');
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Email atau password salah",
      );
    }
  }
}

// Provider global
final loginNotifierProvider = NotifierProvider<LoginNotifier, LoginState>(
  LoginNotifier.new,
);
