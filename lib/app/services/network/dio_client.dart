import 'package:bus/app/services/network/api_config.dart';
import 'package:bus/app/services/network/dio_interceptor.dart';
import 'package:dio/dio.dart' show Dio, ResponseType, BaseOptions;

abstract class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectionTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      headers: ApiConfig.headers,
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll( [
    DioInterceptor(),

  ]
  );
  static void setAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
