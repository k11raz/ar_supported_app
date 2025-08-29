import 'package:bus/app/domain/domain.dart';

class CheckFavoriteUseCase {
  final FavoritesRepository repository;

  CheckFavoriteUseCase(this.repository);

  Future<bool> call(
    String productId
  ) async {
    return repository.checkIsFavorite(productId: productId);
  }
}
