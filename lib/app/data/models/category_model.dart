import 'package:bus/app/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name};

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name);
  }

  static CategoryModel fromEntity(CategoryEntity category) {
    return CategoryModel(id: category.id, name: category.name);
  }
}
