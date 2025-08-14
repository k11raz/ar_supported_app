import 'package:bus/app/domain/entities/category.dart';
import 'package:bus/app/domain/repositories/category_repository.dart';

class GetCategory {
  final CategoryRepository repository;
  GetCategory(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.fetchCategories();
  }
}