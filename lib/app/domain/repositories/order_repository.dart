import 'package:bus/app/domain/domain.dart';

abstract class CardRepository {
  Future<void> deleteProductItem({String? id});
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  });
  Future<List<BasketItemEntity>> fetchBasketItems({String? orderId});
}
