import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../app.dart';

class SupabaseReviewRemoteDataSource implements ReviewRemoteDataSource {
  final Dio dio;

  SupabaseReviewRemoteDataSource({required this.dio});

  @override
  Future<void> addReviewToProduct({required String productId, required ReviewEntity review}) async {
    try {
      final userId = await sl<UserCacheService>().getUserId();

      await dio.post(
        ApiConfig.baseUrl + ApiConfig.reviews,
        data: {
          "product_id": productId, 
          "user_id": userId,
          "comment": review.comment,
          "rating": review.rating,
          "created_at": review.createdAt.toIso8601String(),
        },
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
      throw Exception("yorum ekleme failed ${e.toString}");
    }
  }

  @override
  Future<void> deleteReview({required String reviewId}) async {
  final queryParams = <String, dynamic>{};

    try {
      queryParams["id"] = 'eq.$reviewId';

      await dio.delete(
        ApiConfig.baseUrl + ApiConfig.reviews,
        queryParameters: queryParams,
      );
    } catch (e) {
      throw Exception("Favori silme de hata oldu. $e");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchReviews({required String productId}) async {
    final queryParams = <String, dynamic>{};

    queryParams['product_id'] = 'eq.$productId';
    
    // if (userId != null) {
    //   queryParams['user_id'] = 'eq.$userId';
    // }

    //log(queryParams.toString());

    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.reviewInfo,
      queryParameters: queryParams,
    );
    //log("Supabase Favorites Response: $response");

    return List<Map<String, dynamic>>.from(response.data);
  }
}
