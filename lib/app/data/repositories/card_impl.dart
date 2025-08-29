import 'package:bus/app/app.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remote;

  CardRepositoryImpl(this.remote);

  @override
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  }) async {
    return remote.addProductToCard(product: product, quantity: quantity);
  }

  @override
  Future<void> deleteProductItem({String? id}) async {
    return await remote.deleteProductItem(id: id);
  }

  @override
  Future<List<BasketItemEntity>> fetchBasketItems({String? orderId}) async {
    final dataList = await remote.fetchBasketItems(orderId: orderId);
    return dataList
        .map((json) => BasketItemModel.fromJson(json).toEntity())
        .toList();
  }
}
