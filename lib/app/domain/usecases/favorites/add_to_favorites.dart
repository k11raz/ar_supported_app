import 'package:bus/app/domain/domain.dart';
import 'package:bus/app/domain/repositories/fav_repository.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository repository;

  AddToFavoritesUseCase(this.repository);

  Future<void> call({
    required ProductEntity product,
  }) async {
    return repository.addProductToFavorites(
      product: product,
    );
  }
}
