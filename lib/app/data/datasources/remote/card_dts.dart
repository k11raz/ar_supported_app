import 'dart:developer';
import 'package:bus/app/app.dart';
import 'package:dio/dio.dart';

class SupabaseCardRemoteDatasource implements CardRemoteDataSource {
  final dio = DioClient.dio;
  final userCacheService = UserCacheService(CacheService());

  @override
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  }) async {
    // Auth yoksa guest UUID oluştur
    //final userId = Uuid().v4();

    try {
      // Pending order var mı?
      final orderRes = await dio.get(
        'orders',
        queryParameters: {'status': 'eq.pending', 'select': '*', 'limit': 1},
      );

      String orderId;

      if (orderRes.data == null ||
          (orderRes.data is List && orderRes.data.isEmpty)) {
        final newOrder = await dio.post(
          'orders',
          data: {'total_amount': 0, 'status': 'pending'},
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
        'order_items',
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
          'products',
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
          'order_items',
          data: {
            'order_id': orderId,
            'product_id': product.id,
            'quantity': quantity,
            'price_at_time': productRes.data[0]['price'],
          },
          options: Options(headers: {'Prefer': 'resolution=merge-duplicates'}),
        );
      } else {
        // Quantity artır
        final newQuantity = (itemRes.data[0]['quantity'] ?? 0) + quantity;
        await dio.patch(
          'order_items',
          data: {'quantity': newQuantity},
          queryParameters: {'id': 'eq.${itemRes.data[0]['id']}'},
          options: Options(headers: {'Prefer': 'resolution=merge-duplicates'}),
        );
      }

      // Order total güncelle
      await dio.post('rpc/calculate_order_total', data: {'order_id': orderId});

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
  final Map<String, dynamic> params = orderId != null ? {'order_id': 'eq.$orderId'} : {};
  
  final response = await dio.get(
    'basket_info',
    queryParameters: params,
  );

  return List<Map<String, dynamic>>.from(response.data);
}
}
