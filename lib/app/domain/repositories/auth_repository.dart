import 'package:bus/app/domain/domain.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
    String? phone,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });
}
