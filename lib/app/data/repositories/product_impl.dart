import 'package:bus/app/data/datasources/remote/product.dart';
import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/data/models/product.dart';
import 'package:bus/app/domain/entities/product.dart';
import 'package:bus/app/domain/repositories/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final dataList = await remoteDatasource.getProducts();
    return dataList.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }
  
  @override
  Future<ProductEntity> createProduct(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await remoteDatasource.addProduct(model.toJson());
    return product;
  }
  
  @override
  void deleteProduct(int id) {
    // TODO: implement deleteProduct
  }
  
  @override
  Future<ProductEntity?> getProductById(int id) async {
    final json = await (remoteDatasource as SupabaseProductRemoteDatasource).getProductById(id.toString());
    if (json == null) return null;
    return ProductModel.fromJson(json).toEntity();
  }
}
