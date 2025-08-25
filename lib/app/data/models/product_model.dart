import 'package:bus/app/domain/entities/product_entity.dart';

class ProductModel {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String categoryId;
  final String? arModelUrl;
  final String imageUrl;
  final DateTime? createdAt;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.categoryId,
    this.arModelUrl,
    required this.imageUrl,
    this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String?,
      price: double.parse(json["price"].toString()),
      stock: int.parse(json["stock"].toString()),
      categoryId: json["category_id"],
      imageUrl: json["image_url"],
      createdAt: json["created_at"] != null
        ? DateTime.tryParse(json["created_at"])
        : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "category_id": categoryId,
    "image_url": imageUrl,
    "created_at": createdAt,
  };

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt, 
      price: price, 
      stock: stock, 
      categoryId: categoryId, 
      imageUrl: imageUrl,
    );
  }

  static ProductModel fromEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name, 
      description: product.description,
      price: product.price, stock: 
      product.stock, 
      categoryId: product.categoryId, 
      imageUrl: product.imageUrl,
      createdAt: product.createdAt
    );
  }
}
