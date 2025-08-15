import 'package:bus/app/domain/entities/product.dart';
import 'package:bus/app/domain/repositories/product.dart';

class GetSearchProducts {
  final ProductRepository repository;
  GetSearchProducts(this.repository);

  Future<List<ProductEntity>> call({required String query}) async {
    return await repository.searchProduct(query);
  }
}
