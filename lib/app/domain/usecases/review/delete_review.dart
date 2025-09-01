import 'package:bus/app/domain/repositories/review_repository.dart';

class DeleteReviewUseCase {
  final ReviewRepository repository;

  DeleteReviewUseCase(this.repository);

  Future<void> call({required String reviewId}) async {
    return await repository.deleteReview(reviewId: reviewId);
  }
}
