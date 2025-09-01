import 'package:bus/app/app.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource remoteDataSource;

  ReviewRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addReviewToProduct({required String productId, required ReviewEntity review}) async {
    return await remoteDataSource.addReviewToProduct(productId: productId, review: review);
  }

  @override
  Future<void> deleteReview({required String reviewId}) async {
    return await remoteDataSource.deleteReview(reviewId: reviewId);
  }

  @override
  Future<List<ReviewItemEntity>> fetchReviews({required String productId}) async {
    final dataList = await remoteDataSource.fetchReviews(productId: productId);
    return dataList.map((e) => ReviewItemModel.fromJson(e).toEntity()).toList();
  }
}
