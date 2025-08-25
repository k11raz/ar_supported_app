import 'package:bus/app/domain/entities/favorites_item_entity.dart';
import 'package:bus/app/domain/entities/product_entity.dart';

abstract class FavoritesRepository {
  Future<List<FavoritesItemEntity>> fetchFavorites({String? id});
  Future<void> deleteFavoriteById(int id);
  Future<void> deleteFavorites();
   Future<void> addProductToFavorites({
    required ProductEntity product,
  });
}
