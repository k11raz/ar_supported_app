import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseUserRemoteDatasource implements UserRemoteDatasource {
  final Dio dio;

  SupabaseUserRemoteDatasource({required this.dio});

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response = await dio.get(ApiConfig.baseUrl + ApiConfig.users);
    //log(response.data);
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<void> addUser(Map<String, dynamic> data) async {
    await dio.post(ApiConfig.baseUrl + ApiConfig.users, data: data);
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.users,
      queryParameters: {'id': 'eq.$id', 'select': '*', },
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }

  Future<void> deleteUserById(int id) async {
    await dio.delete(
      ApiConfig.baseUrl + ApiConfig.users,
      queryParameters: {'id': 'eq.$id'},
    );
  }

  Future<bool> authenticate(String email, String password) async {
    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.users,
      queryParameters: {
        'email': 'eq.$email',
        'password': 'eq.$password',
        'select': 'id',
      },
    );
    return response.data.isNotEmpty;
  }
}
