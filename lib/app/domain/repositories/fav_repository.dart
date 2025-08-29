import '../../app.dart';

abstract class FavoritesRepository {
  Future<List<FavoritesItemEntity>> fetchFavorites({String? id});
  Future<void> deleteFavorites({String? id});
  Future<void> addProductToFavorites({required ProductEntity product});
  Future<bool> checkIsFavorite({required String productId});
}
