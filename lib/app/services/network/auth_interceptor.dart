import 'package:dio/dio.dart';
import '../../app.dart';

class AuthInterceptor extends Interceptor {
  final UserCacheService userCacheService;

  AuthInterceptor(this.userCacheService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await userCacheService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await userCacheService.cache.read<String>(
        'refresh_token',
      );
      if (refreshToken != null) {
        try {
          final dio = Dio();
          final response = await dio.post(
            'https://rhhrrmqaptiacdkipsvx.supabase.co/auth/v1/token?grant_type=refresh_token',
            data: {"refresh_token": refreshToken},
            options: Options(headers: {"apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJoaHJybXFhcHRpYWNka2lwc3Z4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2NDU3MzgsImV4cCI6MjA2ODIyMTczOH0.nvxJ6zuF6zxw7I3O9bzBYqpIXg8Z3yV9SOrDqrDwrM0"}),
          );

          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];
          final expiresAt = response.data['expires_at'];

          await userCacheService.saveToken(newAccessToken);
          await userCacheService.cache.write('refresh_token', newRefreshToken);
          await userCacheService.cache.write('expires_at', expiresAt);

          // Orijinal request’i yeni token ile tekrar dene
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          final cloneReq = await Dio().fetch(err.requestOptions);
          return handler.resolve(cloneReq);
        } catch (e) {
          return handler.next(err); // refresh başarısız
        }
      }
    }
    return handler.next(err);
  }
}
