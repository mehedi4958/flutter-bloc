class RegisterStates {
  const RegisterStates({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
