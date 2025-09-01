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
    required DateTime createdAt,
    String? phone,
  });

  Future<UserModel> signIn({required String email, required String password});

  Future<UserModel> currentUser();
}

abstract class CardRemoteDataSource {
  Future<void> addProductToCard({
    required ProductEntity product,
    int quantity = 1,
  });
  Future<void> deleteProductItem({String? id});

  Future<List<Map<String, dynamic>>> fetchBasketItems({String? orderId});
}

abstract class FavoritesRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchFavorites({String? id});
  Future<void> deleteFavorites({String? id});
  Future<void> addProductToFavorites({required ProductEntity product});
  Future<bool> checkIfFavorite(String productId);
}

abstract class ReviewRemoteDataSource {
  Future<List<Map<String,dynamic>>> fetchReviews({required String productId});
  Future<void> deleteReview({required String reviewId});
  Future<void> addReviewToProduct({
    required String productId,
    required ReviewEntity review,
  });
}
