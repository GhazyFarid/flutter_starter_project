import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final bool isLoading;
  final String? errorMessage;

  const RegisterState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
    this.phone = '',
    this.isLoading = false,
    this.errorMessage,
  });

  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.length >= 6 &&
      rePassword.length >= 6 &&
      phone.isNotEmpty;

  RegisterState copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phone: phone ?? this.phone,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class RegisterNotifier extends Notifier<RegisterState> {
  @override
  RegisterState build() => const RegisterState();

  void setName(String value) => state = state.copyWith(name: value.trim());
  void setEmail(String value) => state = state.copyWith(email: value.trim());
  void setPhone(String value) => state = state.copyWith(phone: value.trim());
  void setPassword(String value) =>
      state = state.copyWith(password: value.trim());
  void setRePassword(String value) =>
      state = state.copyWith(rePassword: value.trim());

  Future<void> register() async {
    if (!state.isValid) {
      state = state.copyWith(
        errorMessage: 'Semua field harus diisi dan password >= 6 karakter',
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi API
    await Future.delayed(const Duration(seconds: 2));

    // Dummy Response
    state = state.copyWith(
      isLoading: false,
      errorMessage: 'Register berhasil! Silahkan login',
    );
  }
}

// Provider Global
final registerNotifierProvider =
    NotifierProvider<RegisterNotifier, RegisterState>(RegisterNotifier.new);
