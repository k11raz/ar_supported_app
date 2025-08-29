import 'package:dio/dio.dart';
import '../../app.dart';

class AuthInterceptor extends Interceptor {
  final UserCacheService userCacheService;

  AuthInterceptor(this.userCacheService);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await userCacheService.getAccessToken();
    //log('Interceptor token: $token');
    
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    //log('Headers being sent: ${options.headers}');
    handler.next(options);
  }
}
