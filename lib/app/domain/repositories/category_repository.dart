import 'package:bus/app/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> fetchCategories();
  Future<CategoryEntity?> getCategoryById(String id);
}
