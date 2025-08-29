import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseProductRemoteDatasource implements ProductRemoteDatasource {
  final Dio dio;

  SupabaseProductRemoteDatasource({required this.dio});

  @override
  Future<List<Map<String, dynamic>>> getProducts({String? categoryId}) async {
    final queryParams = <String, dynamic>{};

    if (categoryId != null) {
      queryParams['category_id'] = 'eq.$categoryId';
    }

    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.products,
      queryParameters: queryParams,
    );
    //log("Supabase Response: $response");

    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<void> addProduct(Map<String, dynamic> data) async {
    await dio.post(ApiConfig.baseUrl + ApiConfig.products, data: data);
  }

  Future<Map<String, dynamic>?> getProductById(String id) async {
    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.products,
      queryParameters: {'id': 'eq.$id', 'select': '*'},
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }

  Future<void> deleteProductById(int id) async {
    await dio.delete(
      ApiConfig.baseUrl + ApiConfig.products,
      queryParameters: {'id': 'eq.$id'},
    );
  }

  @override
  Future<List<Map<String, dynamic>>> searchProduct({String? query}) async {
    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.products,
      queryParameters: {'name': 'ilike.%$query%'},
    );

    if (response.data == null || response.data.isEmpty) return [];

    //log('Search product: ${response.data}');

    return List<Map<String, dynamic>>.from(response.data);
  }
}
