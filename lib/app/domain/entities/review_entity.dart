class ReviewEntity {
  final String id;
  final String userId;
  final String productId;
  final int rating;
  final String comment;
  final DateTime createdAt;

  const ReviewEntity( {
    required this.id, 
    required this.userId, 
    required this.productId, 
    required this.rating, 
    required this.comment, 
    required this.createdAt,
  });
}
