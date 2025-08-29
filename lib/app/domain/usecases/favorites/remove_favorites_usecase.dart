import 'package:bus/app/app.dart';

class RemoveFavoritesUsecase {
  final FavoritesRepository repository;

  RemoveFavoritesUsecase(this.repository);

    Future<void> call({String? id}) async {
    return await repository.deleteFavorites(id: id);
  }
}
