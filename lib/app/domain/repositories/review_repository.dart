import 'package:bus/app/domain/entities/review_entity.dart';
import 'package:bus/app/domain/entities/review_item_entity.dart';

abstract class ReviewRepository {
  Future<List<ReviewItemEntity>> fetchReviews({required String productId});

  Future<void> deleteReview({required String reviewId});

  Future<void> addReviewToProduct({
    required String productId,
    required ReviewEntity review,
  });
}
