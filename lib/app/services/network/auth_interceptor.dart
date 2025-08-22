import 'dart:developer';

import 'package:bus/app/services/cache/user_cache.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final UserCacheService userCacheService;

  AuthInterceptor(this.userCacheService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = await userCacheService.getAccessToken();
    log(token);

    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }
}
