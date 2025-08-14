import 'package:bus/app/data/datasources/remote/category.dart';
import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/data/models/category.dart';
import 'package:bus/app/domain/entities/category.dart';
import 'package:bus/app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDatasource;

  CategoryRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    final dataList = await remoteDatasource.getCategories();
    return dataList
        .map((json) => CategoryModel.fromJson(json).toEntity())
        .toList();
  }

  @override
  Future<CategoryEntity?> getCategoryById(String id) async {
    final json = await (remoteDatasource as SupabaseCategoryRemoteDatasource)
        .getCategoryById(id.toString());
    if (json == null) return null;
    return CategoryModel.fromJson(json).toEntity();
  }
}
