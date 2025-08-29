import 'dart:developer';
import 'package:bus/app/app.dart';
import 'package:dio/dio.dart';

class SupabaseCardRemoteDatasource implements CardRemoteDataSource {
  final Dio dio;

  SupabaseCardRemoteDatasource({required this.dio});

  @override
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  }) async {
    final userId = await sl<UserCacheService>().getUserId();
    try {
      final orderRes = await dio.get(
        ApiConfig.baseUrl + ApiConfig.orders,
        queryParameters: {'status': 'eq.pending', 'select': '*', 'limit': 1},
      );

      String orderId;

      if (orderRes.data == null ||
          (orderRes.data is List && orderRes.data.isEmpty)) {
        final newOrder = await dio.post(
          ApiConfig.baseUrl + ApiConfig.orders,
          data: {'total_amount': 0, 'status': 'pending', 'user_id': userId},
        );

        if (newOrder.data == null || newOrder.data.isEmpty) {
          throw Exception("Yeni sipariş oluşturulamadı");
        }

        orderId = newOrder.data[0]['id'];
      } else {
        orderId = orderRes.data[0]['id'];
      }

      // Sepette item var mı?
      final itemRes = await dio.get(
        ApiConfig.baseUrl + ApiConfig.orderItems,
        queryParameters: {
          'order_id': 'eq.$orderId',
          'product_id': 'eq.${product.id}',
          'select': '*',
          'limit': 1,
        },
      );

      if (itemRes.data == null ||
          (itemRes.data is List && itemRes.data.isEmpty)) {
        final productRes = await dio.get(
          ApiConfig.baseUrl + ApiConfig.products,
          queryParameters: {
            'id': 'eq.${product.id}',
            'select': 'price',
            'limit': 1,
          },
        );

        if (productRes.data == null || productRes.data.isEmpty) {
          throw Exception("Ürün bulunamadı");
        }

        await dio.post(
          ApiConfig.baseUrl + ApiConfig.orderItems,
          data: {
            'order_id': orderId,
            'product_id': product.id,
            'quantity': quantity,
            'price_at_time': productRes.data[0]['price'],
          },
        );
      } else {
        // Quantity artır
        final newQuantity = (itemRes.data[0]['quantity'] ?? 0) + quantity;
        await dio.patch(
          ApiConfig.baseUrl + ApiConfig.orderItems,
          data: {'quantity': newQuantity},
          queryParameters: {'id': 'eq.${itemRes.data[0]['id']}'},
          options: Options(headers: {'Prefer': 'resolution=merge-duplicates'}),
        );
      }

      // Order total güncelle
      await dio.post(
        '${ApiConfig.baseUrl}rpc/calculate_order_total',
        data: {'order_id': orderId},
      );

      log('Ürün sepete eklendi: ${product.id}');
    } catch (e) {
      if (e is DioException) {
        log('DioException: ${e.message}');
        log('Request URL: ${e.requestOptions.uri}');
        log('Request data: ${e.requestOptions.data}');
        log('Query params: ${e.requestOptions.queryParameters}');
        log('Status code: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');
      }
      throw Exception('Sepete ekleme başarısız: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchBasketItems({String? orderId}) async {
    final userId = await sl<UserCacheService>().getUserId();

    final Map<String, dynamic> params = <String, dynamic>{};

    if (orderId != null) {
      params['order_id'] = 'eq.$orderId';
    }

    if (userId != null) {
      params['user_id'] = 'eq.$userId';
    }

    final response = await dio.get(
      ApiConfig.baseUrl + ApiConfig.basketInfo,
      queryParameters: params,
    );

    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<void> deleteProductItem({String? id}) async {
    final queryParams = <String, dynamic>{};

    try {
      queryParams["id"] = 'eq.$id';

      await dio.delete(
        ApiConfig.baseUrl + ApiConfig.orderItems,
        queryParameters: queryParams,
      );
    } catch (e) {
      throw Exception("Item silme de hata oldu. $e");
    }
  }
}
