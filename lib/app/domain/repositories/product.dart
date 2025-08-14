import 'package:bus/app/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> fetchProducts();
  Future<ProductEntity?> getProductById(int id);
  Future<ProductEntity> createProduct(ProductEntity user);
  void deleteProduct(int id);
}
