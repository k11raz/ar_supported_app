import 'package:bus/app/domain/entities/review_entity.dart';
import 'package:bus/app/domain/repositories/review_repository.dart';

class AddReviewUseCase {
  final ReviewRepository repository;

  AddReviewUseCase(this.repository);

  Future<void> call({
    required String productId,
    required ReviewEntity review,
  }) async {
    return await repository.addReviewToProduct(
      productId: productId,
      review: review,
    );
  }
}
