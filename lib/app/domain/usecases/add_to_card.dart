import 'package:bus/app/domain/repositories/order_repository.dart';

class AddToCardUseCase {
  final CardRepository repository;

  AddToCardUseCase(this.repository);

  Future<void> call({
    required String userId,
    required String productId,
    int quantity = 1,
  }) async {
    return repository.addProductToCard(
      userId: userId,
      productId: productId,
      quantity: quantity,
    );
  }
}
