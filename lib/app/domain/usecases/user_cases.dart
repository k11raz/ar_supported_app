import 'package:bus/app/domain/repositories/user_repository.dart';

class AuthenticateUser {
  final UserRepository repository;

  AuthenticateUser(this.repository);

  Future<bool> execute(String email, String password) async {
    if(email.isEmpty || password.isEmpty) {
      throw ArgumentError("Email ve şifre boş olamaz");
    }
    final result = await repository.authenticate(email, password);

    return result;
  }
}
