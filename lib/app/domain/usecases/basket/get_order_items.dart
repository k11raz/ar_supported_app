import 'package:bus/app/domain/entities/basket_item.dart';
import 'package:bus/app/domain/entities/order_items.dart';
import 'package:bus/app/domain/repositories/order_repository.dart';

class GetOrderItems {
  final CardRepository repository;
  GetOrderItems(this.repository);

  Future<List<BasketItemEntity>> call({String? orderId}) async {
    return await repository.fetchBasketItems(orderId: orderId);
  }
}
