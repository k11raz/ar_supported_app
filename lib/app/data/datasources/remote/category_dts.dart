import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/services/network/api_config.dart';
import 'package:dio/dio.dart';

class SupabaseCategoryRemoteDatasource implements CategoryRemoteDataSource {
  final Dio dio;

  SupabaseCategoryRemoteDatasource({required this.dio});

  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    final response = await dio.get(ApiConfig.baseUrl + ApiConfig.categories);
    //log("Supabase categories: $response");
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>?> getCategoryById(String id) async {
    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.categories,
      queryParameters: {'id': 'eq.$id', 'select': '*'},
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }
}
