import 'package:dio/dio.dart';
import '../../app.dart';

class AuthInterceptor extends Interceptor {
  final UserCacheService userCacheService;
  final Dio dio;

  AuthInterceptor(this.userCacheService, {required this.dio});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await userCacheService.getAccessToken();
    // final isExpired = JwtDecoder.isExpired(token);
    //log('Interceptor token: $token');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    //log('Headers being sent: ${options.headers}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await userCacheService.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        return handler.next(err);
      }

      try {
        final tokenResponse = await dio.post(
          '${ApiConfig.baseUrlAuth} ${ApiConfig.refreshToken}',
          data: {"refresh_token": refreshToken},
        );

        final newAccessToken = tokenResponse.data["access_token"];
        final newRefreshToken = tokenResponse.data["refresh_token"];

        await userCacheService.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        final retryRequest = err.requestOptions;
        retryRequest.headers["Authorization"] = "Bearer $newAccessToken";

        final response = await dio.fetch(retryRequest);
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }
}
