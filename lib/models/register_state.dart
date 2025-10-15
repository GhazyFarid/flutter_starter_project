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
