import 'package:bus/app/app.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
    required String name,
    required String surname,
    String? phone,
  }) async {
    return await repository.signUp(
      email: email,
      password: password,
      name: name,
      surname: surname,
      phone: phone,
    );
  }
}
