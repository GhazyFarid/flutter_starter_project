import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_project/models/login_state.dart';
import 'package:flutter_starter_project/repositories/auth_repository.dart';

class LoginNotifier extends Notifier<LoginState> {
  late final AuthRepository _authRepository;

  @override
  LoginState build() {
    _authRepository = AuthRepository();
    return const LoginState();
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> login({required VoidCallback onSuccess}) async {
    final email = state.email.trim().toLowerCase();
    final password = state.password.trim();

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(errorMessage: "Email dan password wajib diisi");
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi delay login API
    // await Future.delayed(const Duration(seconds: 2));

    // validasi sederhana
    // if (email == "admin@gmail.com" && password == "123456") {
    //   state = state.copyWith(isLoading: false, errorMessage: 'Sukses');
    //   onSuccess();
    // } else {
    //   state = state.copyWith(
    //     isLoading: false,
    //     errorMessage: "Email atau password salah",
    //   );
    // }

    // Pakai API asli
    try {
      final result = await _authRepository.login(
        email: email,
        password: password,
      );
      final token = result['access_token'];
      debugPrint('Access Token: $token');

      state = state.copyWith(isLoading: false, errorMessage: '');

      onSuccess();
    } catch (e) {
      final messageError = e.toString().toLowerCase();
      String message;

      // Pesan error
      if (messageError.contains('401') || messageError.contains('invalid')) {
        message = 'Email atau password salah';
      } else if (messageError.contains('timeout')) {
        message = 'Koneksi timeout, periksa jaringan Anda';
      } else if (messageError.contains('socketexception')) {
        message = 'Tidak dapat terhubung ke server';
      } else {
        message = 'Terjadi kesalahan, silakan coba lagi';
      }

      state = state.copyWith(isLoading: false, errorMessage: message);

      debugPrint('Login error: $messageError');
    }
  }
}

// Provider global
final loginNotifierProvider = NotifierProvider<LoginNotifier, LoginState>(
  LoginNotifier.new,
);
