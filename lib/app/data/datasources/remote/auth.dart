import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final Dio dio;

  SupabaseAuthRemoteDataSource({
    required this.dio,
  });

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
        'https://rhhrrmqaptiacdkipsvx.supabase.co/auth/v1/signup',
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            'apikey': dio.options.headers['apikey'],
            'Authorization':
                'Bearer ${DioClient.dio.options.headers['apikey']}',
            'Content-Type': 'application/json',
          },
        ),
      );

      log(dio.options.headers['apikey']);

      log('Auth response: ${authResponse.data}');

      if (authResponse.statusCode != 200 && authResponse.statusCode != 201) {
        throw Exception('Auth signup failed: ${authResponse.data}');
      }

      final userId = authResponse.data['user']['id'];
      final accessToken = authResponse.data['access_token'];

      DioClient.setAuthToken(accessToken);

      final users = {
        'id': userId,
        'email': email,
        'name': name,
        'surname': surname,
        'created_at': DateTime.now().toIso8601String(),
      };
      if (phone != null && phone.isNotEmpty) {
        users['phone'] = phone;
      }

      final profileResponse = await dio.post(
        'https://rhhrrmqaptiacdkipsvx.supabase.co/rest/v1/users',
        data: users,
        options: Options(
          headers: {
            'apikey': dio.options.headers['apikey'],
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );

      log('Profile insert response: ${profileResponse.data}');

      return UserModel.fromJson(profileResponse.data[0]);
    } on DioException catch (e) {
      log('DioException status: ${e.response?.statusCode}');
      log('DioException data: ${e.response?.data}');
      throw Exception("oç supabase failed: $e");
    } catch (e) {
      log('Signup error: $e');
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
      // 1) Auth ile giriş yap
      final authResponse = await dio.post(
        'https://rhhrrmqaptiacdkipsvx.supabase.co/auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'apikey': dio.options.headers['apikey'],
            'Content-Type': 'application/json',
          },
        ),
      );

      if (authResponse.statusCode != 200) {
        throw Exception("Giriş başarısız: ${authResponse.data}");
      }

      final accessToken = authResponse.data['access_token'];
      final userId = authResponse.data['user']['id'];

      // 2) Access token'ı Dio client'a set et
      DioClient.setAuthToken(accessToken);

      // 3) Kullanıcı profilini çek
      final profileResponse = await dio.get(
        'https://rhhrrmqaptiacdkipsvx.supabase.co/rest/v1/users',
        queryParameters: {
          'id': 'eq.$userId',
          'select': '*',
        },
        options: Options(
          headers: {
            'apikey': dio.options.headers['apikey'],
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      if (profileResponse.statusCode != 200 ||
          profileResponse.data == null ||
          (profileResponse.data is List && profileResponse.data.isEmpty)) {
        throw Exception("Kullanıcı profili bulunamadı.");
      }

      return UserModel.fromJson(profileResponse.data[0]);
    } on DioException catch (e) {
      throw Exception("Dio hatası: ${e.response?.data ?? e.message}");
    } catch (e) {
      throw Exception("Giriş hatası: $e");
    }
  }

}
