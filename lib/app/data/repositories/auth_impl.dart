import '../../app.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
    required DateTime createdAt,
    String? phone,
  }) async {
    final model = await remoteDataSource.signUp(
      email: email,
      password: password,
      name: name,
      surname: surname,
      phone: phone,
      createdAt: createdAt
    );

    return model.toEntity();
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final model = await remoteDataSource.signIn(
      email: email,
      password: password,
    );

    return model.toEntity();
  }
  
  @override
  Future<UserEntity> currentUser() async {
    final UserModel user = await remoteDataSource.currentUser();
    return user.toEntity();
  }
}
