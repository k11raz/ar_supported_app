import 'package:bus/app/domain/entities/product.dart';
import 'package:bus/app/domain/repositories/product.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.fetchProducts();
  }
}