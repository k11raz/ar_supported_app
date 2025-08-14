abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String surname;
  final String? phone;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    this.phone,
  });
}
