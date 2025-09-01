import 'package:bus/app/domain/entities/review_item_entity.dart';
import 'package:bus/app/domain/repositories/review_repository.dart';

class FetchReviewUseCase {
  final ReviewRepository repository;
  FetchReviewUseCase(this.repository);

  Future<List<ReviewItemEntity>> call({String? productId}) async {
    if (productId != null) {
       return await repository.fetchReviews(productId: productId);
    }
    return [];
  }
}
