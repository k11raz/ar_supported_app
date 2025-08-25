import 'package:bus/app/app.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addProductToFavorites({required ProductEntity product}) async {
    return await remoteDataSource.addProductToFavorites(product: product);
  }

  @override
  Future<void> deleteFavoriteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavorites() {
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
