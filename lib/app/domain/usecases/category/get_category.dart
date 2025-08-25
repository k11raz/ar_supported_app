import 'dart:developer';

import 'package:bus/app/domain/entities/category_entity.dart';
import 'package:bus/app/domain/repositories/category_repository.dart';

class GetCategory {
  final CategoryRepository repository;
  GetCategory(this.repository);

  Future<List<CategoryEntity>> call() async {
    List<CategoryEntity> response = await repository.fetchCategories();
    log(response.toString());
    return response;
  }
}
