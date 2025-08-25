import 'package:bus/app/domain/entities/product_entity.dart';
import 'package:bus/app/domain/repositories/product_repository.dart';

class GetSearchProducts {
  final ProductRepository repository;
  GetSearchProducts(this.repository);

  Future<List<ProductEntity>> call(String query) async {
    return await repository.searchProduct(query);
  }
}
