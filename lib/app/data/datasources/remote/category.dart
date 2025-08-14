import 'dart:developer';

import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/network/dio_client.dart';

class SupabaseCategoryRemoteDatasource implements CategoryRemoteDataSource {
  final dio = DioClient.dio;

  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    final response = await dio.get('categories');
    log("Supabase categories: $response");
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>?> getCategoryById(String id) async {
    final response = await dio.get(
      'categories',
      queryParameters: {'id': 'eq.$id', 'select': '*'},
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }
}
