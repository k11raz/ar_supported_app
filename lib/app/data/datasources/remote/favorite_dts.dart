import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseFavoritesRemoteDataSource implements FavoritesRemoteDataSource {
  final Dio dio;

  SupabaseFavoritesRemoteDataSource({required this.dio});

  @override
  Future<void> addProductToFavorites({required ProductEntity product}) async {
    try {
      final userId = await sl<UserCacheService>().getUserId();

      await dio.post(
        ApiConfig.baseUrl + ApiConfig.favorites,
        data: {"product_id": product.id, "user_id": userId},
      );
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
  Future<List<Map<String, dynamic>>> fetchFavorites({String? id}) async {
    final userId = await sl<UserCacheService>().getUserId();
    final queryParams = <String, dynamic>{};

    if (id != null) {
      queryParams['id'] = 'eq.$id';
    }
    if (userId != null) {
      queryParams['user_id'] = 'eq.$userId';
    }

    //log(queryParams.toString());

    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.favInfo,
      queryParameters: queryParams,
    );
    //log("Supabase Favorites Response: $response");

    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<bool> checkIfFavorite(String productId) async {
    final queryParams = <String, dynamic>{};

    try {
      queryParams['id'] = 'eq.$productId';

      await dio.get(
        ApiConfig.baseUrl + ApiConfig.favorites,
        queryParameters: queryParams,
      );
      return true;
    } catch (e) {
      throw Exception(
        "Favorites karşılaştırmalarında hata çıktı ${e.toString()}",
      );
    }
  }

  @override
  Future<void> deleteFavorites({String? id}) async {
    final queryParams = <String, dynamic>{};

    try {
      queryParams["product_id"] = 'eq.$id';

      await dio.delete(
        ApiConfig.baseUrl + ApiConfig.favorites,
        queryParameters: queryParams,
      );
    } catch (e) {
      throw Exception("Favori silme de hata oldu. $e");
    }
  }
}
