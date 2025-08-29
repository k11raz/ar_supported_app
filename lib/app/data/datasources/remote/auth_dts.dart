import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final Dio dio;
  final UserCacheService userCacheService;

  SupabaseAuthRemoteDataSource({
    required this.dio,
    required this.userCacheService,
  });

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
    String? phone,
    required DateTime createdAt,
  }) async {
    try {
      final authResponse = await dio.post(
        ApiConfig.baseUrlAuth + ApiConfig.signUp,
        data: {'email': email, 'password': password},
      );

      final userId = authResponse.data['user']['id'];
      //final accessToken = authResponse.data['access_token'];

      // await userCacheService.saveToken(accessToken);

      // await userCacheService.getAccessToken();

      final user = UserModel(
        id: userId,
        email: email,
        name: name,
        surname: surname,
        phone: phone,
        createdAt: DateTime.now(),
      );

      await dio.post(ApiConfig.baseUrl + ApiConfig.users, data: user);

      return user;
    } catch (e) {
      throw Exception("Supabase Failed: $e");
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

      await userCacheService.saveToken(accessToken);

      final profileResponse = await dio.get(
        ApiConfig.baseUrl + ApiConfig.users,
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
      final authResponse = await dio.get("${ApiConfig.baseUrl}users");
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
