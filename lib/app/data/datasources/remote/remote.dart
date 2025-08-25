import '../../../app.dart';

abstract class UserRemoteDatasource {
  Future<List<Map<String, dynamic>>> getUsers();
  Future<void> addUser(Map<String, dynamic> data);
}

abstract class ProductRemoteDatasource {
  Future<List<Map<String, dynamic>>> getProducts({String? categoryId});
  Future<void> addProduct(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> searchProduct({String query});
}

abstract class CategoryRemoteDataSource {
  Future<List<Map<String, dynamic>>> getCategories();
}

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String surname,
    String? phone,
  });

   Future<UserModel> signIn({
    required String email,
    required String password,
  });
}

abstract class CardRemoteDataSource {
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1
  });

  Future<List<Map<String, dynamic>>> fetchBasketItems({String? orderId});
}

abstract class FavoritesRemoteDataSource {
  Future<List<Map<String,dynamic>>> fetchFavorites({String? id});
  Future<void> deleteFavoriteById(int id);
  Future<void> deleteFavorites();
   Future<void> addProductToFavorites({
    required ProductEntity product,
  });
}
