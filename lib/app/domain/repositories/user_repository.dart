import 'package:bus/app/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchUsers();
  Future<UserEntity?> getUserById(int id);
  Future<UserEntity> createUser(UserEntity user);
  void deleteUser(int id);
  Future<bool> authenticate(String email, String password);
}
