

import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/domain/repositories/order_repository.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remote;

  CardRepositoryImpl({required this.remote});

  @override
  Future<void> addProductToCard({
    required String userId,
    required String productId,
    int quantity = 1,
  }) {
    return remote.addProductToCard(
      userId: userId,
      productId: productId,
      quantity: quantity,
    );
  }
  
  @override
  void deleteProductItem(String id) {
    // TODO: implement deleteProductItem
  }
}
