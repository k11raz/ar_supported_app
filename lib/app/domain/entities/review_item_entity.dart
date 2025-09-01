class ReviewItemEntity {
  final String reviewId;
  final String userId;
  final String productId;
  final String name;
  final String surname;
  final String comment;
  final int rating;
  final DateTime createdAt;

  const ReviewItemEntity( {
    required this.reviewId, 
    required this.userId, 
    required this.productId, 
    required this.name,
    required this.surname, 
    required this.comment, 
    required this.rating, 
    required this.createdAt,
  });
}
