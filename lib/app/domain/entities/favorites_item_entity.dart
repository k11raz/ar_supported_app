class FavoritesItemEntity {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String imageUrl;

  FavoritesItemEntity({
    required this.id,
    required this.name, 
    this.description, 
    required this.price, 
    required this.stock, 
    required this.imageUrl, 
  });
}
