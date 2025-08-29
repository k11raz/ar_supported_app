// lib/app/services/network/dio_client.dart
import 'package:dio/dio.dart' show Dio, ResponseType, BaseOptions;

import '../../app.dart';

class DioClient {
  Dio createDio() {
    return Dio(
      BaseOptions(
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: ApiConfig.headers,
        responseType: ResponseType.json,
      ),
    );
  }
}