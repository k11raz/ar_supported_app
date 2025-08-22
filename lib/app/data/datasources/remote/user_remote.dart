import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/services/network/dio_client.dart';

class SupabaseUserRemoteDatasource implements UserRemoteDatasource {
  final dio = DioClient.dio;

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response = await dio.get('users');
    print(response);
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<void> addUser(Map<String, dynamic> data) async {
    await dio.post('users', data: data);
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final response = await dio.get(
      'users',
      queryParameters: {'id': 'eq.$id', 'select': '*'},
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }

  Future<void> deleteUserById(int id) async {
    await dio.delete('users', queryParameters: {'id': 'eq.$id'});
  }

  Future<bool> authenticate(String email, String password) async {
    final response = await dio.get(
      'users',
      queryParameters: {
        'email': 'eq.$email',
        'password': 'eq.$password',
        'select': 'id',
      },
    );
    return response.data.isNotEmpty;
  }
}
