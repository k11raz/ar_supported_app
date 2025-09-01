import 'dart:convert';
import 'dart:developer';
import 'package:bus/app/app.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserCacheService {
  static const userKey = 'userToken';
  static const accessTokenKey = 'access_token';
  final ICacheService cache;

  UserCacheService(this.cache);

  Future<bool> isLoggedIn() async {
    final token = await cache.read<String>(accessTokenKey);
    if (token == null) {
      return false;
    }

    // final isExpired = JwtDecoder.isExpired(token);

    // if (isExpired) {
    //   await removeUser();
    // }

    //log(token);
    return token.toString().isNotEmpty;
    //return !JwtDecoder.isExpired(token);
  }

  Future<void> saveUser(UserModel user) async {
    await cache.write(userKey, jsonEncode(user.toJson()));
  }

  Future<UserEntity?> getTokenUser() async {
    final token = await cache.read<String>(userKey);
    //log('Kaydedilen token : $token');
    if (token != null) {
      return UserModel.fromJson(jsonDecode(token)).toEntity();
    }

    return null;
  }

  Future<void> saveToken(String token) async {
    //log('Saving token: $token');
    //Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    await cache.write(accessTokenKey, token);
    //log("token saved");
  }

  Future<String?> getUserId() async {
    final token = await getAccessToken();
    if (token == null) return null;

    final decoded = JwtDecoder.decode(token);
    log(decoded['sub']);
    return decoded['sub'];
  }

  Future<String?> getAccessToken() async {
    return await cache.read(accessTokenKey);
  }

  Future<void> removeToken() async {
    await cache.remove(accessTokenKey);
  }

  Future<void> removeUser() async {
    await cache.remove(userKey);
    await cache.remove(accessTokenKey);
  }
}
