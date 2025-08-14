import 'package:bus/app/domain/entities/product.dart';

class ProductModel {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String category_id;
  final String? ar_model_url;
  final String image_url;
  final DateTime? created_at;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.category_id,
    this.ar_model_url,
    required this.image_url,
    this.created_at,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String?,
      price: double.parse(json["price"].toString()),
      stock: int.parse(json["stock"].toString()),
      category_id: json["category_id"],
      image_url: json["image_url"],
      created_at: json["created_at"] != null
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
    "category_id": category_id,
    "image_url": image_url,
    "created_at": created_at,
  };

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      created_at: created_at, 
      price: price, 
      stock: stock, 
      category_id: category_id, 
      image_url: image_url,
    );
  }

  static ProductModel fromEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name, 
      description: product.description,
      price: product.price, stock: 
      product.stock, 
      category_id: product.category_id, 
      image_url: product.image_url,
      created_at: product.created_at
    );
  }
}
