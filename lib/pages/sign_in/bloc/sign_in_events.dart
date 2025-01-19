abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvent extends SignInEvents {
  const EmailEvent(this.email);
  final String email;
}

class PasswordEvent extends SignInEvents {
  const PasswordEvent(this.password);
  final String password;
}
