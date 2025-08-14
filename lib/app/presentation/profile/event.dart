abstract class LoginEvent {}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}
