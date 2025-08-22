import 'dart:convert';
import 'dart:developer';
import 'package:bus/app/app.dart';
import 'package:bus/app/services/cache/i_cache_service.dart';

class UserCacheService {
  static const userKey = 'userToken';
  static const accessTokenKey = 'access_token';
  final ICacheService cache;

  UserCacheService(this.cache);

  bool get isLoggedIn {
    final token = cache.read(userKey);
    return token.toString().isNotEmpty;
  }

  Future<void> saveUser(UserModel user) async {
    await cache.write(userKey, jsonEncode(user.toJson()));
  }

  Future<UserEntity?> getTokenUser() async {
    final token = await cache.read<String>(userKey);
    log('Kaydedilen token : $token');
    if (token != null) {
      return UserModel.fromJson(jsonDecode(token)).toEntity();
    }

    return null;
  }

  Future<void> saveToken(String token) async {
    await cache.write(accessTokenKey, token);
  }

  Future<String> getAccessToken() async {
    return await cache.read(accessTokenKey);
  }

  Future<void> removeUser() async {
    await cache.remove(userKey);
    await cache.remove(accessTokenKey);
  }
}
