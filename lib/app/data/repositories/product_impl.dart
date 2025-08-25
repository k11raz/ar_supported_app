import 'package:bus/app/data/datasources/remote/product_dts.dart';
import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/data/models/product_model.dart';
import 'package:bus/app/domain/entities/product_entity.dart';
import 'package:bus/app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<ProductEntity>> fetchProducts({String? categoryId}) async {
    final dataList = await remoteDatasource.getProducts(categoryId: categoryId);
    return dataList
        .map((json) => ProductModel.fromJson(json).toEntity())
        .toList();
  }
  
  @override
  Future<ProductEntity> createProduct(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await remoteDatasource.addProduct(model.toJson());
    return product;
  }
  
  @override
  void deleteProduct(int id) {
  }
  
  @override
  Future<ProductEntity?> getProductById(int id) async {
    final json = await (remoteDatasource as SupabaseProductRemoteDatasource).getProductById(id.toString());
    if (json == null) return null;
    return ProductModel.fromJson(json).toEntity();
  }
  
  @override
  Future<List<ProductEntity>> searchProduct(String query) async {
    final dataList = await remoteDatasource.searchProduct(query: query);
    return dataList
        .map((json) => ProductModel.fromJson(json).toEntity())
        .toList();
  }
}
