abstract class UserRemoteDatasource {
  Future<List<Map<String, dynamic>>> getUsers();
  Future<void> addUser(Map<String, dynamic> data);
}

abstract class ProductRemoteDatasource {
  Future<List<Map<String, dynamic>>> getProducts();
  Future<void> addProduct(Map<String, dynamic> data);
}

abstract class CategoryRemoteDataSource {
  Future<List<Map<String, dynamic>>> getCategories();
}
