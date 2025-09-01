import 'package:bus/app/domain/entities/review_item_entity.dart';

class ReviewItemModel {
  final String reviewId;
  final String userId;
  final String productId;
  final String name;
  final String surname;
  final String comment;
  final int rating;
  final DateTime createdAt;

  ReviewItemModel( {
    required this.reviewId, 
    required this.userId, 
    required this.productId,
    required this.name, 
    required this.surname, 
    required this.comment, 
    required this.rating, 
    required this.createdAt,
  });

  factory ReviewItemModel.fromJson(Map<String, dynamic> json) {
    return ReviewItemModel(
      reviewId: json['review_id'],
      userId: json['user_id'],
      productId: json['product_id'],
      name: json['name'],
      surname: json['surname'],
      comment: json['comment'],
      rating : int.parse(json['rating'].toString()),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  ReviewItemEntity toEntity() {
    return ReviewItemEntity(
      reviewId: reviewId, 
      userId: userId, 
      productId: productId, 
      name: name, 
      surname: surname, 
      comment: comment, 
      rating: rating, 
      createdAt: createdAt
      
    );
  }
}
