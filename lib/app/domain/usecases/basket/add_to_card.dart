import 'package:bus/app/domain/domain.dart';

class AddToCartUseCase {
  final CardRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call({
    required ProductEntity product,
    int quantity = 1,
  }) async {
    return repository.addProductToCard(
      product: product,
      quantity: quantity,
    );
  }
}
