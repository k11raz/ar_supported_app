class ProductEntity {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String category_id;
  final String? ar_model_url;
  final String image_url;
  final DateTime? created_at;

  ProductEntity({
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
}
