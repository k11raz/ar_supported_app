import 'package:bus/app/domain/domain.dart';
import 'package:bus/app/domain/entities/basket_item.dart';
import 'package:bus/app/domain/entities/order_items.dart';

abstract class CardRepository {
  void deleteProductItem(String id);
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  });
   Future<List<BasketItemEntity>> fetchBasketItems({String? orderId});
}
