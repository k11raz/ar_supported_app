import 'package:bus/app/domain/entities/favorites_item_entity.dart';
import 'package:bus/app/domain/repositories/fav_repository.dart';

class GetFavorites {
  final FavoritesRepository repository;
  GetFavorites(this.repository);

  Future<List<FavoritesItemEntity>> call({String? favId}) async {
    return await repository.fetchFavorites(id: favId);
  }
}
