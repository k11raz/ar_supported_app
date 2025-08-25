import 'dart:developer';
import 'package:bus/app/services/network/api_config.dart';
import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final Dio dio;

  SupabaseAuthRemoteDataSource({required this.dio});

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
    String? phone,
  }) async {
    try {
      final authResponse = await dio.post(
        ApiConfig.baseUrlAuth + ApiConfig.signUp,
        data: {'email': email, 'password': password},
      );

      final userId = authResponse.data['user']['id'];
      final accessToken = authResponse.data['access_token'];
      //log('access tokeeennn: $accessToken');

      DioClient.setAuthToken(accessToken);

      final userInfo = {
        'id': userId,
        'email': email,
        'name': name,
        'surname': surname,
        'phone': (phone != null && phone.isNotEmpty) ? phone : null,
        'created_at': DateTime.now().toIso8601String(),
      };

      final profileResponse = await dio.post(ApiConfig.users, data: userInfo);

      return UserModel.fromJson(profileResponse.data);
    } catch (e) {
      log("$e");
      throw Exception("oe supabse failed: $e");
    }
  }

  //LOGIN

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await dio.post(
        ApiConfig.baseUrlAuth + ApiConfig.login,
        data: {'email': email, 'password': password},
      );

      final accessToken = authResponse.data['access_token'];
      final userId = authResponse.data['user']['id'];

      DioClient.setAuthToken(accessToken);

      final profileResponse = await dio.get(
        ApiConfig.users,
        queryParameters: {'id': 'eq.$userId', 'select': '*'},
      );

      return UserModel.fromJson(profileResponse.data[0]);
    } catch (e) {
      throw Exception("Giriş hatası: $e");
    }
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      final authResponse = await dio.get("${ApiConfig.baseUrlAuth}/user");
      log(authResponse.data);

      final userId = authResponse.data['id'];
      final email = authResponse.data['email'];

      final profileResponse = await dio.get(
        ApiConfig.users,
        queryParameters: {'id': 'eq.$userId', 'select': '*'},
      );

      if (profileResponse.data == null || profileResponse.data.isEmpty) {
        throw Exception("Kullanıcı bulunamadı");
      }

      final profileJson = profileResponse.data[0];

      return UserModel.fromJson({'id': userId, 'email': email, ...profileJson});
    } catch (e) {
      log("currentUser error: $e");
      throw Exception("Mevcut kullanıcı alınamadı: $e");
    }
  }
}
