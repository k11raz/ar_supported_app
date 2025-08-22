class ProductEntity {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String categoryId;
  final String? arModelUrl;
  final String imageUrl;
  final DateTime? createdAt;

  ProductEntity({
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
}
