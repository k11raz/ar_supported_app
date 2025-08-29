class FavoritesItemEntity {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String imageUrl;
  final String productId;

  FavoritesItemEntity({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.productId,
  });
}
