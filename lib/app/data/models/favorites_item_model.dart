import 'package:bus/app/domain/entities/favorites_item_entity.dart';

class FavoritesItemModel {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String imageUrl;
  final String productId;

  FavoritesItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.productId
  });

  factory FavoritesItemModel.fromJson(Map<String, dynamic> json) {
    return FavoritesItemModel(
      id: json["id"] as String,
      name: json["name"],
      description: json["description"],
      price: double.parse(json["price"].toString()),
      stock: int.parse(json["stock"].toString()),
      imageUrl: json["image_url"],
      productId: json["product_id"], 
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "image_url": imageUrl,
    "product_id": productId,
  };

  FavoritesItemEntity toEntity() {
    return FavoritesItemEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      stock: stock,
      imageUrl: imageUrl,
      productId: productId
    );
  }

  static FavoritesItemModel fromEntity(FavoritesItemEntity favorite) {
    return FavoritesItemModel(
      id: favorite.id,
      name: favorite.name,
      description: favorite.description,
      price: favorite.price,
      stock: favorite.stock,
      imageUrl: favorite.imageUrl,
      productId: favorite.productId
    );
  }
}
