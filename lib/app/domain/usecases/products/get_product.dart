import 'package:bus/app/domain/entities/product_entity.dart';
import 'package:bus/app/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<ProductEntity>> call({String? categoryId}) async {
    return await repository.fetchProducts(categoryId: categoryId);
  }
}
