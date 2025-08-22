import 'package:bus/app/app.dart';
import 'package:bus/app/data/models/basket_item_models.dart';
import 'package:bus/app/data/models/order_item.dart';
import 'package:bus/app/domain/entities/basket_item.dart';
import 'package:bus/app/domain/entities/order_items.dart';
import 'package:bus/app/domain/repositories/order_repository.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remote;

  CardRepositoryImpl(this.remote);

  @override
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  }) async {
    return remote.addProductToCard(
      product: product,
      quantity: quantity,
    );
  }
  
  @override
  void deleteProductItem(String id) {
    // TODO: implement deleteProductItem
  }

  @override
  Future<List<BasketItemEntity>> fetchBasketItems({String? orderId}) async {
    final dataList = await remote.fetchBasketItems(orderId: orderId);
    return dataList
        .map((json) => BasketItemModel.fromJson(json).toEntity())
        .toList();
  }
}
