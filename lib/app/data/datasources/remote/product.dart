import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/data/network/dio_client.dart';

class SupabaseProductRemoteDatasource implements ProductRemoteDatasource {
  final dio = DioClient.dio;

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    final response = await dio.get('products');
    print("Supabase Response: $response");
    return List<Map<String, dynamic>>.from(response.data);
    
  }

  @override
  Future<void> addProduct(Map<String, dynamic> data) async {
    await dio.post('products', data: data);
  }

  Future<Map<String, dynamic>?> getProductById(String id) async {
    final response = await dio.get(
      'products',
      queryParameters: {
        'id': 'eq.$id',
        'select': '*',
      },
    );
    if (response.data.isEmpty) return null;
    return Map<String, dynamic>.from(response.data.first);
  }

  Future<void> deleteProductById(int id) async {
    await dio.delete(
      'products',
      queryParameters: {
        'id': 'eq.$id',
      },
    );
  }
}

