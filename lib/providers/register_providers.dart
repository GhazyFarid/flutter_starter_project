import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_project/common/api_exceptions.dart';
import 'package:flutter_starter_project/repositories/auth_repository.dart';

import '../models/register_state.dart';

class RegisterNotifier extends Notifier<RegisterState> {
  late final AuthRepository _authRepository;

  @override
  RegisterState build() {
    _authRepository = AuthRepository();
    return const RegisterState();
  }

  void setName(String value) => state = state.copyWith(name: value.trim());
  void setEmail(String value) => state = state.copyWith(email: value.trim());
  void setPhone(String value) => state = state.copyWith(phone: value.trim());
  void setPassword(String value) =>
      state = state.copyWith(password: value.trim());
  void setRePassword(String value) =>
      state = state.copyWith(rePassword: value.trim());

  Future<void> register({required VoidCallback onSuccess}) async {
    final username = state.name.trim();
    final email = state.email.trim().toLowerCase();
    final noTelepon = state.phone.trim();
    final password = state.password.trim();

    debugPrint('data $username $email $noTelepon $password');

    if (username.isEmpty ||
        email.isEmpty ||
        noTelepon.isEmpty ||
        password.isEmpty) {
      state = state.copyWith(
        errorMessage: 'Semua field harus diisi dan password >= 6 karakter',
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi API
    // await Future.delayed(const Duration(seconds: 2));

    // Dummy Response
    // state = state.copyWith(
    //   isLoading: false,
    //   errorMessage: 'Register berhasil! Silahkan login',
    // );
    try {
      final response = await _authRepository.register(
        username: username,
        email: email,
        noTelepon: noTelepon,
        password: password,
      );

      state = state.copyWith(isLoading: false, errorMessage: '');
      debugPrint('response : $response');
      onSuccess();
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Terjadi kesalahan, silakan coba lagi',
      );
    }
  }
}

// Provider Global
final registerNotifierProvider =
    NotifierProvider<RegisterNotifier, RegisterState>(RegisterNotifier.new);
