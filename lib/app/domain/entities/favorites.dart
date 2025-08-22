class FavoritesEntity {
  final String userId;
  final String productId;
  final String id;
  final DateTime? createdAt;

  const FavoritesEntity({
    required this.userId,required this.productId,required this.id,required this.createdAt,
  });
}
