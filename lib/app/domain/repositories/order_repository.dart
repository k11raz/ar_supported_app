import 'package:bus/app/domain/entities/order_items.dart';

abstract class CardRepository {
  void deleteProductItem(String id);
  Future<void> addProductToCard({
    required String userId,
    required String productId,
    int quantity = 1,
  });
}
