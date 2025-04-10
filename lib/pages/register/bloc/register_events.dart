abstract class RegisterEvents {
  const RegisterEvents();
}

class UserNameEvent extends RegisterEvents {
  const UserNameEvent(this.userName);

  final String userName;
}

class EmailEvent extends RegisterEvents {
  const EmailEvent(this.email);
  final String email;
}

class PasswordEvent extends RegisterEvents {
  const PasswordEvent(this.password);
  final String password;
}

class RePasswordEvent extends RegisterEvents {
  const RePasswordEvent(this.rePassword);
  final String rePassword;
}
