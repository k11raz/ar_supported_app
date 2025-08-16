import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/network/dio_client.dart';

class SupabaseCardRemoteDatasource implements CardRemoteDataSource {
  final dio = DioClient.dio;

  @override
  Future<void> addProductToCard({
    required String userId,
    required String productId,
    int quantity = 1,
  }) async {

    try {
       final orderRes = await dio.get(
        "orders",
        queryParameters: {
          'user_id': 'eq.$userId',
          'status': 'eq.pending',
          'select': '*',
          'limit': 1,
        },
      );

      String orderId;

      if (orderRes.data.isEmpty) {
        // 2️⃣ Yoksa yeni order oluştur
        final newOrder = await dio.post(
          'orders',
          data: {
            'user_id': userId,
            'total_amount': 0,
            'status': 'pending',
          },
        );
        orderId = newOrder.data[0]['id'];
      } else {
        orderId = orderRes.data[0]['id'];
      }

    // 3️⃣ Sepette item var mı
      final itemRes = await dio.get(
        'order_items',
        queryParameters: {
          'order_id': 'eq.$orderId',
          'product_id': 'eq.$productId',
          'select': '*',
          'limit': 1,
        },
      );

      if (itemRes.data.isEmpty) {
        // fiyatı çek
        final productRes = await dio.get(
          'products',
          queryParameters: {'id': 'eq.$productId', 'select': 'price', 'limit': 1},
        );

        await dio.post(
          'order_items',
          data: {
            'order_id': orderId,
            'product_id': productId,
            'quantity': quantity,
            'price_at_time': productRes.data[0]['price'],
          },
        );
      } else {
        // quantity artır
        await dio.patch(
          'order_items',
          data: {
            'quantity': itemRes.data[0]['quantity'] + quantity,
          },
          queryParameters: {'id': 'eq.${itemRes.data[0]['id']}'},
        );
      }

        // 4️⃣ RPC çağırarak total güncelle
      await dio.post(
        'rpc/calculate_order_total',
        data: {'order_id': orderId},
      );
    } catch (e) {
      throw Exception('Sepete ekleme başarısız: $e');
    }
   
  }
}
