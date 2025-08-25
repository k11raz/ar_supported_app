import 'package:bus/app/app.dart';

class CurrentUserUseCase {
  final AuthRepository authRepository;

  CurrentUserUseCase(this.authRepository);

  Future<UserEntity> call() async {
    return await authRepository.currentUser();
  }
}
