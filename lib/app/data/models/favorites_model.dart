import 'package:bus/app/domain/entities/favorites_entity.dart';

class FavoritesModel {
  final String userId;
  final String productId;
  final String id;
  final DateTime? createdAt;

  FavoritesModel({
    required this.userId, 
    required this.productId, 
    required this.id, 
    required this.createdAt,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      id: json["id"] as String,
      productId: json["product_id"],
      userId: json["user_id"],
      createdAt: json["created_at"] != null
        ? DateTime.tryParse(json["created_at"])
        : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id" : productId,
    "user_id": userId,
    "created_at": createdAt,
  };

  FavoritesEntity toEntity() {
    return FavoritesEntity(
      id: id, 
      userId: userId, 
      productId: productId, 
      createdAt: createdAt,
      
    );
  }

  static FavoritesModel fromEntity(FavoritesEntity favorite) {
    return FavoritesModel(
      id: favorite.id,
      createdAt: favorite.createdAt, 
      userId: favorite.userId, 
      productId: favorite.productId
    );
  }
}
