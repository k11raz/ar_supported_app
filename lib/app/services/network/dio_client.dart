import 'package:dio/dio.dart';

abstract class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://rhhrrmqaptiacdkipsvx.supabase.co/rest/v1/',
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJoaHJybXFhcHRpYWNka2lwc3Z4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2NDU3MzgsImV4cCI6MjA2ODIyMTczOH0.nvxJ6zuF6zxw7I3O9bzBYqpIXg8Z3yV9SOrDqrDwrM0',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        
      },
    ),
  );
  static void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
