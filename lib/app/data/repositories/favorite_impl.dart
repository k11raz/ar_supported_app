import 'package:bus/app/app.dart';
import 'package:bus/app/data/models/favorites.dart';
import 'package:bus/app/data/models/favorites_item_model.dart';
import 'package:bus/app/domain/entities/favorites.dart';
import 'package:bus/app/domain/entities/favorites_item.dart';
import 'package:bus/app/domain/repositories/fav_repository.dart';

class FavoriteRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addProductToFavorites({required ProductEntity product}) async {
    return await remoteDataSource.addProductToFavorites(product: product);
  }

  @override
  Future<void> deleteFavoriteById(int id) {
    // TODO: implement deleteFavoriteById
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavorites() {
    // TODO: implement deleteFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<FavoritesItemEntity>> fetchFavorites({String? id}) async {
    final dataList = await remoteDataSource.fetchFavorites(id: id);
    return dataList
        .map((json) => FavoritesItemModel.fromJson(json).toEntity())
        .toList();
  }
}
