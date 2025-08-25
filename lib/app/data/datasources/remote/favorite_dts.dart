import 'dart:developer';
import 'package:bus/app/data/data.dart';
import 'package:bus/app/domain/entities/product_entity.dart';
import 'package:dio/dio.dart';

class SupabaseFavoritesRemoteDataSource implements FavoritesRemoteDataSource {
  final dio = DioClient.dio;

  @override
  Future<void> addProductToFavorites({required ProductEntity product}) async {
    try {
      await dio.post('favorites', data: {"product_id": product.id});
    } catch (e) {
      if (e is DioException) {
        log('DioException: ${e.message}');
        log('Request URL: ${e.requestOptions.uri}');
        log('Request data: ${e.requestOptions.data}');
        log('Query params: ${e.requestOptions.queryParameters}');
        log('Status code: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');
      }
      throw Exception("favorilere ekleme failed ${e.toString}");
    }
  }

  @override
  Future<void> deleteFavoriteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavorites() {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchFavorites({String? id}) async {
    final queryParams = <String, dynamic>{};

    if (id != null) {
      queryParams['id'] = 'eq.$id';
    }

    final response = await dio.get('fav_info', queryParameters: queryParams);
    //log("Supabase Favorites Response: $response");

    return List<Map<String, dynamic>>.from(response.data);
  }
}
