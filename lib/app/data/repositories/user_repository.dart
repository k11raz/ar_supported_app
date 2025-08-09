import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/data/datasources/remote/user_remote.dart';
import 'package:bus/app/data/models/user_model.dart';
import 'package:bus/app/domain/entities/user.dart';
import 'package:bus/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<UserEntity>> fetchUsers() async {
    final dataList = await remoteDatasource.getUsers();
    return dataList.map((json) => UserModel.fromJson(json).toEntity()).toList();
  }

  @override
  Future<UserEntity?> getUserById(int id) async {
    final json = await (remoteDatasource as SupabaseUserRemoteDatasource).getUserById(id);
    if (json == null) return null;
    return UserModel.fromJson(json).toEntity();
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final model = UserModel.fromEntity(user);
    await remoteDatasource.addUser(model.toJson());
    return user;
  }

  @override
  Future<bool> authenticate(String email, String password) async {
    return await (remoteDatasource as SupabaseUserRemoteDatasource)
        .authenticate(email, password);
  }
  
  @override
  Future<UserEntity> deleteUser(int id) {
    throw UnimplementedError();
  }
}
